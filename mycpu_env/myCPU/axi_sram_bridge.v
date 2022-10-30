 module axi_sram_bridge(
    input clk,
    input reset,
    
    // inst sram interface
    input inst_sram_req,
    input inst_sram_wr,
    input [ 1:0] inst_sram_size,
    input [ 3:0] inst_sram_wstrb,
    input [31:0] inst_sram_addr,
    input [31:0] inst_sram_wdata,
    output inst_sram_addr_ok,
    output inst_sram_data_ok,
    output [31:0] inst_sram_rdata,
    // data sram interface
    input data_sram_req,
    input data_sram_wr,
    input [ 1:0] data_sram_size,
    input [ 3:0] data_sram_wstrb,
    input [31:0] data_sram_addr,
    input [31:0] data_sram_wdata,
    output data_sram_addr_ok,
    output data_sram_data_ok,
    output [31:0] data_sram_rdata,
    // axi interface
    output [ 3:0] arid,
    output [31:0] araddr,
    output [ 7:0] arlen,
    output [ 2:0] arsize,
    output [ 1:0] arburst,
    output [ 1:0] arlock,
    output [ 3:0] arcache,
    output [ 2:0] arprot,
    output arvalid,
    input arready,
    
    input [ 3:0] rid,
    input [31:0] rdata,
    input [ 1:0] rresp,
    input rlast,
    input rvalid,
    output rready,
    
    output [ 3:0] awid,
    output [31:0] awaddr,
    output [ 7:0] awlen,
    output [ 2:0] awsize,
    output [ 1:0] awburst,
    output [ 1:0] awlock,
    output [ 3:0] awcache,
    output [ 2:0] awprot,
    output awvalid,
    input awready,
    
    output [ 3:0] wid,
    output [31:0] wdata,
    output [ 3:0] wstrb,
    output wlast,
    output wvalid,
    input wready,
    
    input [ 3:0] bid,
    input [ 1:0] bresp,
    input bvalid,
    output bready
);

wire data_sram_wreq = data_sram_req & data_sram_wr;
wire data_sram_rreq = data_sram_req & ~data_sram_wr;

//* 写事务
parameter AXI_W_OK     = 4'b0001;
parameter WINFO_OK     = 4'b0010;
parameter AXI_WADDR_OK = 4'b0100;
parameter AXI_WDATA_OK = 4'b1000;

wire [3:0] next_w_state;
reg [3:0] w_state;
reg  [3:0] w_count;

wire axi_w_ok     = w_state[0];
wire winfo_ok     = w_state[1];
wire axi_waddr_ok = w_state[2];
wire axi_wdata_ok = w_state[3];
// wire w_wait       = w_state[4];

wire [70:0] winfo = {data_sram_size, //70:68
                     data_sram_wstrb, //67:64
                     data_sram_addr, //63:32
                     data_sram_wdata};//31:0
reg [70:0] wbuf;
wire [3:0] next_r_state;
reg [3:0] r_state;
reg [3:0] r_count;

wire axi_r_ok      = r_state[0];
wire inst_rinfo_ok = r_state[1];
wire data_rinfo_ok = r_state[2];
wire r_wait        = r_state[3];

wire [34:0] rdinfo = {1'b0,
                      data_sram_size, //63:32   
                      data_sram_addr};//31:0
wire [34:0] iinfo = {1'b0,
                     inst_sram_size, //63:32
                     inst_sram_addr}; //32:0
reg [34:0] rbuf;
reg rready_r;
reg bready_r;

always @(posedge clk) begin
    if (reset) begin
        w_state <= AXI_W_OK;
    end else begin
        w_state <= next_w_state;
    end
end

assign next_w_state[0] = winfo_ok     & wready & awready |
                         axi_waddr_ok & wready           | 
                         axi_wdata_ok & awready          |
                         axi_w_ok     & ~data_sram_wreq  ; //axi_w_ok
assign next_w_state[1] = axi_w_ok     & data_sram_wreq     |
                         winfo_ok     & ~wready & ~awready ;
                        //  w_wait       & (r_count == 4'b0000); //winfo_ok
assign next_w_state[2] = winfo_ok     & awready |
                         axi_waddr_ok & ~wready ; //axi_waddr_ok
assign next_w_state[3] = winfo_ok     & wready  |
                         axi_wdata_ok & ~awready; //axi_wdata_ok
// assign next_w_state[4] = axi_w_ok     & data_sram_wreq & ~(r_count == 4'b0000) |
//                          w_wait       & ~(r_count == 4'b0000);

always @(posedge clk) begin
    if (reset) begin
        w_count <= 4'b0000;
    end else if (axi_w_ok && next_w_state[1] && !(bvalid && bready && bid)) begin
        w_count <= w_count + 1'b1;
    end else if (bvalid && bready && bid && !(axi_w_ok && next_w_state[1])) begin
        w_count <= w_count - 1'b1;
    end
end


always @(posedge clk) begin
    if (reset) begin
        wbuf <= 70'd0;
    end else if (axi_w_ok & data_sram_wreq) begin
        wbuf <= winfo;
    end
end

/* 读事务 */
//localparam AXI_R_OK      = 4'0001,
//           INST_RINFO_OK = 4'0010,
//           DATA_RINFO_OK = 4'0100,
//           R_WAIT        = 4'1000;

always @(posedge clk) begin
    if (reset) begin
        r_state <= 4'd1;
    end else begin
        r_state <= next_r_state;
    end
end

assign next_r_state[0] = (inst_rinfo_ok | 
                          data_rinfo_ok) & arready |
                          axi_r_ok       & ~data_sram_rreq & ~inst_sram_req; //axi_r_ok
assign next_r_state[1] = axi_r_ok        & inst_sram_req   & ~data_sram_rreq |
                         inst_rinfo_ok   & ~arready; //inst_rinfo_ok
assign next_r_state[2] = axi_r_ok        & data_sram_rreq  & (~(|w_count) | ~(wbuf[63:32] == data_sram_addr)) |
                         data_rinfo_ok   & ~arready |
                         r_wait          & ~(|w_count); //data_rinfo_ok
assign next_r_state[3] = axi_r_ok        & data_sram_rreq  & |w_count & (wbuf[63:32] == data_sram_addr) |
                         r_wait          & |w_count; //r_wait 

always @(posedge clk) begin
    if (reset) begin
        r_count <= 4'b0000;
    end else if ((axi_r_ok && next_r_state[2] || r_wait && next_r_state[2]) && !(rvalid && rready && rid)) begin
        r_count <= r_count + 1'b1;
    end else if (!(axi_r_ok && next_r_state[2] || r_wait && next_r_state[2]) && (rvalid && rready && rid)) begin
        r_count <= r_count - 1'b1;
    end
end

always @(posedge clk) begin
    if (reset) begin
        rbuf <= 64'd0;
    end else if (axi_r_ok & data_sram_rreq) begin
        rbuf <= rdinfo;
    end else if (axi_r_ok & inst_sram_req) begin
        rbuf <= iinfo;
    end
end

always @(posedge clk) begin
    if (reset) begin
        rready_r <= 1'b1;
    end else if (axi_r_ok && data_sram_rreq && |w_count) begin //取数请求之前有未响应的写
        rready_r <= 1'b0;
    end else if (~(|w_count)) begin
        rready_r <= 1'b1;
    end
end

always @(posedge clk) begin
    if (reset) begin
        bready_r <= 1'b1;
    end else if (axi_w_ok && data_sram_wreq && |r_count) begin
        bready_r <= 1'b0;
    end else if (~(|r_count)) begin
        bready_r <= 1'b1;
    end
end

assign arid = inst_rinfo_ok ? 1'b0 : 1'b1; //TODO inst:0 data:1
assign araddr = rbuf[32:0]; //TODO
assign arlen = 8'd0;
assign arsize = rbuf[34:32]; //TODO
assign arburst = 2'd1; //?????????
assign arlock = 2'd0;
assign arcache = 4'd0;
assign arprot = 3'd0;
assign arvalid = inst_rinfo_ok | data_rinfo_ok; //TODO
//arready
 
//TODO rid inst:0 data:1
//TODO rdata
//rresp: ignored
//rlast: ignored
//TODO rvalid
assign rready = rid ? rready_r : 1'd1; //TODO 

assign awid = 4'd1;
assign awaddr = wbuf[63:32]; //TODO
assign awlen = 8'd0;
assign awsize = wbuf[70:68]; //TODO
assign awburst = 2'd1;
assign awlock = 2'd0;
assign awcache = 4'd0;
assign awprot = 3'd0;
assign awvalid = winfo_ok | axi_wdata_ok; //TODO 
//TODO awready 

assign wid = 4'd1;
assign wdata = wbuf[31:0]; //TODO
assign wstrb = wbuf[67:64]; //TODO
assign wlast = 1'd1;
assign wvalid = winfo_ok | axi_waddr_ok; //TODO
//TODO wready
//bid: ignored
//bresp: ignored
//TODO bvalid
assign bready = bready_r; //TODO ????????????????????????????

assign inst_sram_addr_ok = axi_r_ok & ~data_sram_rreq; //TODO
assign inst_sram_data_ok = rvalid & rready & ~rid; //TODO
assign inst_sram_rdata   = rdata; //TODO

assign data_sram_addr_ok = axi_w_ok & data_sram_wr | axi_r_ok & ~data_sram_wr; //TODO
assign data_sram_data_ok = bvalid & bready & wid | rvalid & rready & rid; //TODO
assign data_sram_rdata = rdata; //TODO


endmodule
