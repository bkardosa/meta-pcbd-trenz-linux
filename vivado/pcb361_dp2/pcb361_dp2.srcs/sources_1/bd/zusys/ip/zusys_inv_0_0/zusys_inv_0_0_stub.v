// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Fri Oct  8 13:38:16 2021
// Host        : bopcb-dell running 64-bit Ubuntu 20.04.1 LTS (fossa-beric-tgl X40)
// Command     : write_verilog -force -mode synth_stub
//               /home/bopcb/work/vivado/pcb361_dp2/pcb361_dp2.srcs/sources_1/bd/zusys/ip/zusys_inv_0_0/zusys_inv_0_0_stub.v
// Design      : zusys_inv_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu2cg-sfvc784-1-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "util_vector_logic_v2_0_1_util_vector_logic,Vivado 2019.2.1" *)
module zusys_inv_0_0(Op1, Res)
/* synthesis syn_black_box black_box_pad_pin="Op1[0:0],Res[0:0]" */;
  input [0:0]Op1;
  output [0:0]Res;
endmodule
