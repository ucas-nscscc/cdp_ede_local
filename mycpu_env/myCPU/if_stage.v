`include "mycpu.h"

module if_stage(
    input                          clk            ,
    input                          reset          ,
    //allwoin
    input                          ds_allowin     ,
    //brbus
    input  [`BR_BUS_WD       -1:0] br_bus         ,
    //ih to fs bus
    input  [`IH_TO_FS_BUS_WD -1:0] ih_to_fs_bus   ,
    //mmu to pfs bus
    input  [`MMU_TO_PFS_BUS_WD - 1:0] mmu_to_pfs_bus,
    //to ds
    output                         fs_to_ds_valid ,
    output [`FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus   ,
    output [`PFS_TO_MMU_BUS_WD - 1:0] pfs_to_mmu_bus,
    // inst sram access
    output        inst_sram_req    ,
    output        inst_sram_wr     ,
    output [ 1:0] inst_sram_size   ,
    output [ 3:0] inst_sram_wstrb  ,
    // output [31:0] inst_sram_addr   ,
    output [31:0] inst_sram_wdata  ,
    input         inst_sram_addr_ok,
    input         inst_sram_data_ok,
    input  [31:0] inst_sram_rdata
);

/* IF stage */
reg  [`PFS_TO_FS_BUS_WD - 1:0] pfs_to_fs_bus_r; 
wire        fs_pif;
wire        fs_ppi;
wire        fs_tlbr;
wire        fs_pfs_inst_cancel;
wire        fs_pfs_inst_valid;
wire [31:0] fs_pfs_inst;
wire [31:0] fs_pc;

wire        fs_br_taken;
reg         fs_br_taken_r;
reg         fs_valid;
wire        fs_ready_go;
reg         fs_ready_go_r;
wire        fs_buf_valid;
reg  [31:0] fs_buf_inst;
wire        fs_allowin;
wire [31:0] fs_inst;

/* Pre-IF stage */
wire [`PFS_TO_FS_BUS_WD - 1:0] pfs_to_fs_bus;
wire        pfs_ex_adef;
wire        pfs_inst_cancel;
reg         pfs_inst_cancel_r;
wire        pfs_inst_valid;
wire [31:0] pfs_inst;
reg  [31:0] pfs_pc;

wire [31:0] inst_sram_addr;
reg         pfs_valid;
wire        pfs_allowin;
wire        pfs_to_fs_valid;
wire        pfs_ready_go;
reg         pfs_ready_go_r;
wire        pfs_br_taken;
reg         pfs_br_taken_r;
wire [31:0] pfs_br_target;
reg  [31:0] pfs_br_target_r;
reg         pfs_buf_valid;
reg  [31:0] pfs_buf_inst;
wire        pfs_fs_inst_has_taken;
wire [31:0] nextpc;
wire [31:0] seq_pc;

/* exception bus */
wire        fs_ex_taken;
wire [31:0] fs_ex_pc;
assign {fs_ex_taken, fs_ex_pc} = ih_to_fs_bus;

/* branch bus */
wire        br_taken;
wire [31:0] br_target;
assign {br_taken, br_target} = br_bus;

/* mmu to pfs bus */
wire pfs_inst_pif;
wire pfs_inst_ppi;
wire pfs_inst_tlbr;

/* (pre)-IF exception */
wire        fs_ex_adef;


//* IF stage
assign fs_to_ds_bus = {fs_pif,
                       fs_ppi,
                       fs_tlbr,
                       fs_ex_adef,
                       fs_inst   , 
                       fs_pc     };
assign {
    fs_ex_adef,
    fs_pif,
    fs_ppi,
    fs_tlbr,
    fs_pfs_inst_cancel,
    fs_pfs_inst_valid,
    fs_pfs_inst ,
    fs_pc
} = pfs_to_fs_bus_r;

// assign fs_ex_adef = |fs_pc[1:0] | fs_pc[31];

assign fs_inst = {32{~fs_buf_valid & ~fs_pfs_inst_valid & inst_sram_data_ok}} & inst_sram_rdata |
                 {32{fs_buf_valid                                          }} & fs_buf_inst     |
                 {32{fs_pfs_inst_valid                                     }} & fs_pfs_inst ;

/*
 * IF级指令需要取消的几种情况：
 *  （1）在本级取消指令：一方面是指令取消信号（fs_br_taken_r || fs_pfs_inst_cancel），
 *  另一方面是指令取消条件（fs_pfs_inst_valid || inst_sram_data_ok）。指令取消信号表示需要取消本级指令，
 *  指令取消条件表示本级已经收到了需要取消的指令
 *  （2）在ID级取消指令：
 * 
 * fs_ready_go的3种情况：
 *  当本级指令需要取消，即取消信号为真时，需要掩掉fs_ready_go，一直到取消的指令处理完毕（接收到对应的inst_sram_data_ok）
 *  （1）IF级可以直接取来自pre-IF级的指令（fs_pfs_inst_valid）
 *  （2）pre-IF级传来的指令无效，inst_sram_data_ok返回的当拍（!fs_pfs_inst_valid && inst_sram_data_ok）
 *  （3）pre-IF级传来的指令无效，inst_sram_data_ok返回后（fs_ready_go_r）
 */
assign fs_ready_go    = (!fs_pfs_inst_valid && inst_sram_data_ok || 
                          fs_ready_go_r                          ||
                          fs_pfs_inst_valid                       ) && !(fs_br_taken_r || fs_pfs_inst_cancel);
assign fs_allowin     = !fs_valid || fs_ready_go && ds_allowin; //无效或完成且被接收
assign fs_to_ds_valid = fs_valid && fs_ready_go; //有效且完成且上一指令非跳转
assign fs_buf_valid   = fs_ready_go_r;
always @(posedge clk) begin
    if (reset) begin
        fs_valid <= 1'b0;
    end else if (fs_valid && (fs_br_taken_r || fs_pfs_inst_cancel) && (fs_pfs_inst_valid || inst_sram_data_ok)) begin 
        fs_valid <= 1'b0;
    end else if (fs_allowin) begin //如可接收下一任务
        fs_valid <= pfs_to_fs_valid; //接收前一级的状态
    end 
    // else if (br_taken && fs_ready_go)begin
    //     fs_valid <= 1'b0;
    // end

    if (pfs_to_fs_valid && fs_allowin || fs_ex_taken) begin //接收到前一级任务
        pfs_to_fs_bus_r <= pfs_to_fs_bus;
    end
end

/*
 * IF级接收到inst_sram_data_ok需要保持的情况：
 *  pre-IF级传来的指令无效且data_ok传来时ID级还不能进入
 * fs_ready_go_r同时充当IF级指令缓存的有效位valid
 */
always @(posedge clk) begin
    if (reset) begin
        fs_ready_go_r <= 1'b0;
    end else if (inst_sram_data_ok && !fs_pfs_inst_valid && !ds_allowin) begin
        fs_ready_go_r <= 1'b1;
    end else if (ds_allowin) begin
        fs_ready_go_r <= 1'b0;
    end
end

always @(posedge clk) begin
    if (inst_sram_data_ok && !fs_ready_go_r) begin
        fs_buf_inst <= inst_sram_rdata;
    end 
end

/* 
 * fs_br_taken_r寄存器是跳转信号的驻留，需要保留的条件是：
 *  此时IF级在等待inst_sram_data_ok响应
 */
assign fs_br_taken = (fs_ex_taken || (br_taken && !fs_ex_taken)) || fs_br_taken_r;
always @(posedge clk) begin
    if (reset) begin
        fs_br_taken_r <= 1'b0;
    end else if (fs_ex_taken && !fs_allowin && !(!fs_pfs_inst_valid && inst_sram_data_ok || fs_ready_go_r || fs_pfs_inst_valid)) begin
        fs_br_taken_r <= 1'b1;
    end else if (br_taken && !fs_allowin && !(!fs_pfs_inst_valid && inst_sram_data_ok || fs_ready_go_r || fs_pfs_inst_valid)) begin
        fs_br_taken_r <= 1'b1;
    end else if (inst_sram_data_ok) begin
        fs_br_taken_r <= 1'b0;
    end
end

//* pre-IF stage

/*
 ! 取指pc现在由pre-IF级维护
 */
assign {
    pfs_ex_adef,
    pfs_inst_pif,
    pfs_inst_ppi,
    pfs_inst_tlbr
} = mmu_to_pfs_bus;

assign pfs_to_fs_bus = {
    pfs_ex_adef,
    pfs_inst_pif,
    pfs_inst_ppi,
    pfs_inst_tlbr,
    pfs_inst_cancel, 
    pfs_inst_valid,
    pfs_inst ,
    inst_sram_addr
};

assign pfs_to_mmu_bus = {
    inst_sram_addr
};
/*
 *  1）pre-IF级中指令缓存有效；
 *  2）响应数据恰好在pre-IF与IF握手成功一拍到达。
 * 对应pfs_inst_valid的两个或式
 *
 * 判断inst_sram_data_ok对应pre-IF级的3种情况：
 *  1）IF级无效（!fs_valid）；
 *  2）IF级已握手（fs_ready_go_r）；
 *  3）IF级的指令由pre-IF级提供（fs_pfs_inst_valid）。
 */
assign pfs_fs_inst_has_taken = !fs_valid || fs_ready_go_r || fs_pfs_inst_valid;
assign pfs_inst_valid  = pfs_buf_valid || (inst_sram_data_ok && (pfs_fs_inst_has_taken));
assign pfs_inst        = pfs_buf_valid ? pfs_buf_inst : inst_sram_rdata;

// assign pfs_valid       = ~reset;
assign pfs_ready_go    = inst_sram_req && inst_sram_addr_ok || pfs_ready_go_r;
assign pfs_allowin     = !pfs_valid || pfs_ready_go && fs_allowin;
assign pfs_to_fs_valid = pfs_valid && pfs_ready_go;

/*
 * pfs_pc是每个请求周期第一个发出的地址（因为在请求响应前地址可变）。
 * 当上一次请求的指令需要取消时，在pre-IF和IF级握手时将pfs_pc更新为跳转目标地址，
 * 这样本次请求可以开始从跳转目标取指。
 //// nextpc暂时未使用
 */
assign seq_pc          = inst_sram_addr + 3'h4;
assign nextpc          = pfs_inst_cancel ? pfs_br_target : seq_pc;
always @(posedge clk) begin
    if (reset) begin
        pfs_valid <= 1'b0;
    end else begin
        pfs_valid <= 1'b1;
    end
end
always @(posedge clk) begin
    if (reset) begin
        pfs_pc <= 32'h1c000000;
    end else if (pfs_to_fs_valid && fs_allowin) begin
        pfs_pc <= nextpc;
    end
end

/*
 * pre_IF请求握手成功须保持的情况：
 *  数据请求握手成功并且IF级还不能进入（下一拍pre-IF传不到IF）
 */
always @(posedge clk) begin
    if (reset) begin
        pfs_ready_go_r <= 1'b0;
    end else if (inst_sram_req && inst_sram_addr_ok && !fs_allowin) begin
        pfs_ready_go_r <= 1'b1;
    end else if (fs_allowin) begin
        pfs_ready_go_r <= 1'b0;
    end
end

/*
 * pre-IF级指令缓存有效的情况：
 *  收到的inst_sram_data_ok为本级请求对应的数据响应，且IF级还不能进入
 *  （若此时握手成功，则直接将inst_sram_rdata传给IF级）
 *
 * pre-IF级缓存刷新的情况：
 *  数据响应且之前pfs_buf_valid无效，防止buf中的有效指令被覆盖
 */
always @(posedge clk) begin
    if (reset) begin
        pfs_buf_valid <= 1'b0;
    end else if (inst_sram_data_ok && !fs_allowin && pfs_fs_inst_has_taken) begin
        pfs_buf_valid <= 1'b1;
    end else if (fs_allowin) begin
        pfs_buf_valid <= 1'b0;
    end
end

always @(posedge clk) begin
    if (inst_sram_data_ok && !pfs_buf_valid) begin
        pfs_buf_inst <= inst_sram_rdata;
    end
end

/*
 * br_taken需保持的情况：
 *  ID级产生跳转信号，但pre-IF级与IF级握手不成功
 *
 * br_taken_r相当于br_target_r的有效位valid
 */
assign pfs_br_taken    = (fs_ex_taken || (br_taken && !fs_ex_taken)) || pfs_br_taken_r;
assign pfs_br_target   = fs_ex_taken ? fs_ex_pc  :
                         br_taken    ? br_target :
                                       pfs_br_target_r;
always @(posedge clk) begin
    if (reset) begin
        pfs_br_taken_r <= 1'b0;
    end else if (fs_ex_taken && !(pfs_to_fs_valid && fs_allowin)) begin
        pfs_br_taken_r <= 1'b1;
    end else if (br_taken && !(pfs_to_fs_valid && fs_allowin)) begin
        pfs_br_taken_r <= 1'b1;
    end else if (pfs_to_fs_valid && fs_allowin) begin
        pfs_br_taken_r <= 1'b0;
    end
end

always @(posedge clk) begin
    if (fs_ex_taken) begin
        pfs_br_target_r <= fs_ex_pc;
    end else if (br_taken && !pfs_br_taken_r) begin
        pfs_br_target_r <= br_target;
    end
end

/*
 * IF级指令需取消（因为pre-IF级请求已握手）的情况：
 *  ID级指令发生跳转，且此时pre-IF级请求恰好握手或已握手
 * pre-IF级cancel信号需保持的情况：
 *  发生跳转+响应握手成功+与下一级握手不成功
 */
assign pfs_inst_cancel = ((fs_ex_taken || (br_taken && !fs_ex_taken)) && pfs_ready_go) || pfs_inst_cancel_r;
always @(posedge clk) begin
    if (reset) begin
        pfs_inst_cancel_r <= 1'b0;
    end else if (fs_ex_taken && pfs_ready_go && !(fs_allowin && pfs_to_fs_valid)) begin
        pfs_inst_cancel_r <= 1'b1;
    end else if (br_taken && pfs_ready_go && !(fs_allowin && pfs_to_fs_valid)) begin
        pfs_inst_cancel_r <= 1'b1;
    end else if (pfs_to_fs_valid && fs_allowin && pfs_to_fs_valid) begin
        pfs_inst_cancel_r <= 1'b0;
    end
end

//* inst sram access

/*
 * pre-IF级的请求地址根据跳转时访存请求的响应情况进行选择：
 *  （1）请求已响应，此时pfs_inst_cancel && pfs_br_taken，那么在下一次pre-IF与IF握手时，
 *  将pfs_pc更新成pfs_br_target，下一请求将取跳转目标地址的指令；
 *  （2）请求未响应，此时pfs_br_taken && !pfs_inst_cancel，那么可以直接将inst_sram_addr
 *  更新跳转目标地址，下一请求从跳转目标+4开始顺序取指。
 */
assign inst_sram_req   = pfs_valid & ~pfs_ready_go_r;
assign inst_sram_wr    = 1'b0;
assign inst_sram_size  = 2'h2;
assign inst_sram_wstrb = 4'h0;
assign inst_sram_addr  = (pfs_br_taken && !pfs_inst_cancel) ? pfs_br_target : pfs_pc;
assign inst_sram_wdata = 32'b0;

endmodule
