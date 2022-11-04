module sram_to_axi_bridge (
    ////axi interface
    input         aclk,
    input         aresetn,

    //read request
    output [ 3:0] arid,
    output [31:0] araddr,
    output [ 7:0] arlen,    //ok
    output [ 2:0] arsize,
    output [ 1:0] arburst,  //ok
    output [ 1:0] arlock,   //ok
    output [ 3:0] arcache,  //ok
    output [ 2:0] arprot,   //ok
    output        arvalid,
    input         arready,

    //read response
    input  [ 3:0] rid,
    input  [31:0] rdata,
    input  [ 1:0] rresp,    //ignore
    input         rlast,    //ignore
    input         rvalid,
    output        rready,

    //write request
    output [ 3:0] awid,     //ok
    output [31:0] awaddr,
    output [ 7:0] awlen,    //ok
    output [ 2:0] awsize,
    output [ 1:0] awburst,  //ok
    output [ 1:0] awlock,   //ok
    output [ 3:0] awcache,  //ok
    output [ 2:0] awprot,   //ok
    output        awvalid,
    input         awready,

    //write data
    output [ 3:0] wid,      //ok
    output [31:0] wdata,
    output [ 3:0] wstrb,
    output        wlast,    //ok
    output        wvalid,
    input         wready,

    //write response
    input  [ 3:0] bid,
    input  [ 1:0] bresp,
    input         bvalid,
    output        bready,

    ////inst sram interface
    input         inst_sram_req,
    input         inst_sram_wr,
    input  [ 1:0] inst_sram_size,
    input  [31:0] inst_sram_addr,
    input  [ 3:0] inst_sram_wstrb,
    input  [31:0] inst_sram_wdata,
    output        inst_sram_addr_ok,
    output        inst_sram_data_ok,
    output [31:0] inst_sram_rdata,

    ////data sram interface
    input         data_sram_req,
    input         data_sram_wr,
    input  [ 1:0] data_sram_size,
    input  [31:0] data_sram_addr,
    input  [31:0] data_sram_wdata,
    input  [ 3:0] data_sram_wstrb,
    output        data_sram_addr_ok,
    output        data_sram_data_ok,
    output [31:0] data_sram_rdata
);

localparam INSTID = 4'b0,
           DATAID = 4'b1;

assign arlen   = 0;
assign arburst = 2'b01;
assign arlock  = 2'b0;
assign arcache = 4'b0;
assign arprot  = 3'b0;

assign awid    = 4'b1;
assign awlen   = 8'b0;
assign awburst = 2'b01;
assign awlock  = 2'b0;
assign awcache = 4'b0;
assign awprot  = 3'b0;

assign wid     = 4'b1;
assign wlast   = 1'b1;

localparam  IDLE = 6'b000001,
           RADDR = 6'b000010,
           RDATA = 6'b000100,
           WADDR = 6'b001000,
           WDATA = 6'b010000,
           BRESP = 6'b100000;

reg [ 5:0] r_cur;
reg [ 5:0] r_nxt;
reg [ 5:0] w_cur;
reg [ 5:0] w_nxt;

reg        isreading;
reg [ 3:0] arid_r;
reg [31:0] araddr_r;
reg [ 2:0] arsize_r;
reg        arvalid_r;
reg [31:0] rdata_r;

reg        iswriting;
reg [31:0] awaddr_r;
reg [ 2:0] awsize_r;
reg        awvalid_r;
reg [31:0] wdata_r;
reg [ 3:0] wstrb_r;

always @(posedge aclk) begin
    if(~aresetn)
        r_cur <= IDLE;
    else
        r_cur <= r_nxt;
end

always @(*) begin
    case(r_cur)
    IDLE:
        if (arvalid & arready)
            r_nxt = RADDR;
        else
            r_nxt = IDLE;
    RADDR:
        if (rvalid & rready)
            r_nxt = RDATA;
        else
            r_nxt = RADDR;
    RDATA:
            r_nxt = IDLE;
    default:
            r_nxt = IDLE;
    endcase
end

always @(posedge aclk) begin
    if (~aresetn)
        arid_r <= 4'b0;
    else if (r_cur == IDLE & ~isreading & ~iswriting & data_sram_req & ~data_sram_wr)
        arid_r <= DATAID;
    else if (r_cur == IDLE & ~isreading & inst_sram_req)
        arid_r <= INSTID;
        
    if (~aresetn)
        araddr_r <= 32'b0;
    else if (r_cur == IDLE & ~isreading & ~iswriting & data_sram_req & ~data_sram_wr)
        araddr_r <= data_sram_addr;
    else if (r_cur == IDLE & ~isreading & inst_sram_req)
        araddr_r <= inst_sram_addr;

    if (~aresetn)
        arsize_r <= 3'b0;
    else if (r_cur == IDLE & ~isreading & ~iswriting & data_sram_req & ~data_sram_wr)
        arsize_r <= data_sram_size;
    else if (r_cur == IDLE & ~isreading & inst_sram_req)
        arsize_r <= inst_sram_size;

    if (~aresetn)
        arvalid_r <= 1'b0;
    else if (r_cur == IDLE & ~isreading & ~iswriting & data_sram_req & ~data_sram_wr)
        arvalid_r <= 1'b1;
    else if (r_cur == IDLE & ~isreading & inst_sram_req)
        arvalid_r <= 1'b1;
    else if (arvalid & arready)
        arvalid_r <= 1'b0;

    if (~aresetn)
        rdata_r <= 32'b0;
    else if (rvalid & rready)
        rdata_r <= rdata;
    
    if (~aresetn)
        isreading <= 1'b0;
    else if (r_cur == IDLE & ~isreading & ~iswriting & data_sram_req & ~data_sram_wr)
        isreading <= 1'b1;
    else if (r_cur == IDLE & ~isreading & inst_sram_req)
        isreading <= 1'b1;
    else if (r_cur == RDATA)
        isreading <= 1'b0;
end

assign arid = arid_r;
assign araddr = araddr_r;
assign arsize = arsize_r;
assign arvalid = arvalid_r;

assign rready = 1'b1;

assign inst_sram_addr_ok = r_cur == RADDR & arid == INSTID;
assign inst_sram_data_ok = r_cur == RDATA & arid == INSTID;
assign inst_sram_rdata = {32{r_cur == RDATA & arid == INSTID}} & rdata_r;
assign data_sram_rdata = {32{r_cur == RDATA & arid == DATAID}} & rdata_r;

always @(posedge aclk) begin
    if(~aresetn)
        w_cur <= IDLE;
    else
        w_cur <= w_nxt;
end

always @(*) begin
    case(w_cur)
    IDLE:
        if (awvalid & awready)
            w_nxt = WADDR;
        else
            w_nxt = IDLE;
    WADDR:
        if (wvalid & wready)
            w_nxt = WDATA;
        else
            w_nxt = WADDR;
    WDATA:
        if (bvalid & bready)
            w_nxt = BRESP;
        else
            w_nxt = WDATA;
    BRESP:
            w_nxt = IDLE;
    default:
            w_nxt = IDLE;
    endcase
end

always @(posedge aclk) begin
    if (~aresetn)
        awaddr_r <= 32'b0;
    else if (w_cur == IDLE & ~(isreading & arid == DATAID) & ~iswriting & data_sram_req & data_sram_wr)
        awaddr_r <= data_sram_addr;

    if (~aresetn)
        awsize_r <= 3'b0;
    else if (w_cur == IDLE & ~(isreading & arid == DATAID) & ~iswriting & data_sram_req & data_sram_wr)
        awsize_r <= data_sram_size;

    if (~aresetn)
        awvalid_r <= 1'b0;
    else if (w_cur == IDLE & ~(isreading & arid == DATAID) & ~iswriting & data_sram_req & data_sram_wr)
        awvalid_r <= 1'b1;
    else if (awvalid & awready)
        awvalid_r <= 1'b0;

    if (~aresetn)
        wdata_r <= 32'b0;
    else if (w_cur == IDLE & ~(isreading & arid == DATAID) & ~iswriting & data_sram_req & data_sram_wr)
        wdata_r <= data_sram_wdata;

    if (~aresetn)
        wstrb_r <= 4'b0;
    else if (w_cur == IDLE & ~(isreading & arid == DATAID) & ~iswriting & data_sram_req & data_sram_wr)
        wstrb_r <= data_sram_wstrb;

    if (~aresetn)
        iswriting <= 1'b0;
    else if (w_cur == IDLE & ~(isreading & arid == DATAID) & ~iswriting & data_sram_req & data_sram_wr)
        iswriting <= 1'b1;
    else if (w_cur == BRESP)
        iswriting <= 1'b0;
end

assign awaddr = awaddr_r;
assign awsize = awsize_r;
assign awvalid = awvalid_r;

assign wdata = wdata_r;
assign wstrb = wstrb_r;
assign wvalid = w_cur == WADDR;
assign bready = 1'b1;

assign data_sram_addr_ok = r_cur == RADDR & arid == DATAID | w_cur == WADDR;
assign data_sram_data_ok = r_cur == RDATA & arid == DATAID | w_cur == BRESP;
endmodule