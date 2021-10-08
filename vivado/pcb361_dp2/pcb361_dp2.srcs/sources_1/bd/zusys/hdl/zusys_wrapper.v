//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
//Date        : Fri Oct  8 13:30:05 2021
//Host        : bopcb-dell running 64-bit Ubuntu 20.04.1 LTS (fossa-beric-tgl X40)
//Command     : generate_target zusys_wrapper.bd
//Design      : zusys_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module zusys_wrapper
   (dp_aux_data_in_0,
    dp_aux_data_oe,
    dp_aux_data_out_0,
    dp_hot_plug_detect_0);
  input dp_aux_data_in_0;
  output [0:0]dp_aux_data_oe;
  output dp_aux_data_out_0;
  input dp_hot_plug_detect_0;

  wire dp_aux_data_in_0;
  wire [0:0]dp_aux_data_oe;
  wire dp_aux_data_out_0;
  wire dp_hot_plug_detect_0;

  zusys zusys_i
       (.dp_aux_data_in_0(dp_aux_data_in_0),
        .dp_aux_data_oe(dp_aux_data_oe),
        .dp_aux_data_out_0(dp_aux_data_out_0),
        .dp_hot_plug_detect_0(dp_hot_plug_detect_0));
endmodule
