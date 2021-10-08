//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
//Date        : Fri Oct  8 13:30:05 2021
//Host        : bopcb-dell running 64-bit Ubuntu 20.04.1 LTS (fossa-beric-tgl X40)
//Command     : generate_target zusys.bd
//Design      : zusys
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "zusys,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=zusys,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "zusys.hwdef" *) 
module zusys
   (dp_aux_data_in_0,
    dp_aux_data_oe,
    dp_aux_data_out_0,
    dp_hot_plug_detect_0);
  input dp_aux_data_in_0;
  output [0:0]dp_aux_data_oe;
  output dp_aux_data_out_0;
  input dp_hot_plug_detect_0;

  wire dp_aux_data_in_0_1;
  wire dp_hot_plug_detect_0_1;
  wire [0:0]inv_0_Res;
  wire zynq_ultra_ps_e_0_dp_aux_data_oe_n;
  wire zynq_ultra_ps_e_0_dp_aux_data_out;
  wire zynq_ultra_ps_e_0_pl_clk1;

  assign dp_aux_data_in_0_1 = dp_aux_data_in_0;
  assign dp_aux_data_oe[0] = inv_0_Res;
  assign dp_aux_data_out_0 = zynq_ultra_ps_e_0_dp_aux_data_out;
  assign dp_hot_plug_detect_0_1 = dp_hot_plug_detect_0;
  zusys_inv_0_0 inv_0
       (.Op1(zynq_ultra_ps_e_0_dp_aux_data_oe_n),
        .Res(inv_0_Res));
  zusys_zynq_ultra_ps_e_0_0 zynq_ultra_ps_e_0
       (.dp_aux_data_in(dp_aux_data_in_0_1),
        .dp_aux_data_oe_n(zynq_ultra_ps_e_0_dp_aux_data_oe_n),
        .dp_aux_data_out(zynq_ultra_ps_e_0_dp_aux_data_out),
        .dp_hot_plug_detect(dp_hot_plug_detect_0_1),
        .maxigp2_arready(1'b0),
        .maxigp2_awready(1'b0),
        .maxigp2_bid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .maxigp2_bresp({1'b0,1'b0}),
        .maxigp2_bvalid(1'b0),
        .maxigp2_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .maxigp2_rid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .maxigp2_rlast(1'b0),
        .maxigp2_rresp({1'b0,1'b0}),
        .maxigp2_rvalid(1'b0),
        .maxigp2_wready(1'b0),
        .maxihpm0_lpd_aclk(zynq_ultra_ps_e_0_pl_clk1),
        .pl_clk0(zynq_ultra_ps_e_0_pl_clk1));
endmodule
