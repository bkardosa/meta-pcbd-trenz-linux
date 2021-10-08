if { [catch {
  # #############################
  # insert settings here:
  set tepath [pwd]/board_files
  if {[file exists ${tepath}/]} {
    set_param board.repoPaths $tepath
    puts "Set Board Part RepoPath: [get_param board.repoPaths]"
  }
  # #############################
}] } {
  puts "Info: (TE) init.tcl failed"
}
