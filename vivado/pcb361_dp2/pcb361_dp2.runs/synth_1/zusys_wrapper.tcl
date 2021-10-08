# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 2
create_project -in_memory -part xczu2cg-sfvc784-1-e

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/bopcb/work/vivado/pcb361_dp2/pcb361_dp2.cache/wt [current_project]
set_property parent.project_path /home/bopcb/work/vivado/pcb361_dp2/pcb361_dp2.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part_repo_paths {/home/bopcb/work/vivado/trenz/board_files} [current_project]
set_property board_part trenz.biz:te0803_2cg_1e:part0:1.0 [current_project]
set_property ip_output_repo /home/bopcb/work/vivado/pcb361_dp2/pcb361_dp2.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib /home/bopcb/work/vivado/pcb361_dp2/pcb361_dp2.srcs/sources_1/bd/zusys/hdl/zusys_wrapper.v
add_files /home/bopcb/work/vivado/pcb361_dp2/pcb361_dp2.srcs/sources_1/bd/zusys/zusys.bd
set_property used_in_implementation false [get_files -all /home/bopcb/work/vivado/pcb361_dp2/pcb361_dp2.srcs/sources_1/bd/zusys/ip/zusys_zynq_ultra_ps_e_0_0/zusys_zynq_ultra_ps_e_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/bopcb/work/vivado/pcb361_dp2/pcb361_dp2.srcs/sources_1/bd/zusys/ip/zusys_zynq_ultra_ps_e_0_0/zusys_zynq_ultra_ps_e_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/bopcb/work/vivado/pcb361_dp2/pcb361_dp2.srcs/sources_1/bd/zusys/zusys_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/bopcb/work/vivado/pcb361_dp2/pcb361_dp2.srcs/constrs_1/new/emio_pins.xdc
set_property used_in_implementation false [get_files /home/bopcb/work/vivado/pcb361_dp2/pcb361_dp2.srcs/constrs_1/new/emio_pins.xdc]

read_xdc /home/bopcb/work/vivado/pcb361_dp2/pcb361_dp2.srcs/constrs_1/new/bitgen.xdc
set_property used_in_implementation false [get_files /home/bopcb/work/vivado/pcb361_dp2/pcb361_dp2.srcs/constrs_1/new/bitgen.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top zusys_wrapper -part xczu2cg-sfvc784-1-e


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef zusys_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file zusys_wrapper_utilization_synth.rpt -pb zusys_wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]