
set design "Ex7"
set top top
set sim_top top_tb
set device xcvu9p-fsgd2104-2L-e
set proj_dir ./project
set repo_dir ./ip_repo
set project_constraints constraints.xdc

set test_name "test"

# Build project.
create_project -name ${design} -force -dir "." -part ${device}
set_property source_mgmt_mode DisplayOnly [current_project]  
set_property top ${top} [current_fileset]
puts "Creating Project"

create_fileset -constrset -quiet constraints
#add_files -fileset constraints -norecurse ${project_constraints}
#set_property is_enabled false [get_files ${project_constraints}]

#Todo: Add your IP here
<<<<<<< HEAD
<<<<<<< HEAD
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name mem_xtable
set_property -dict [list CONFIG.Component_Name {mem_xtable} CONFIG.Write_Depth_A {64} CONFIG.Load_Init_File {true} CONFIG.Coe_File {/home/centos/CWM-ECAD/Ex7/mem_init.coe}] [get_ips mem_xtable]


=======
>>>>>>> upstream/master
=======
>>>>>>> upstream/master

read_verilog "top.v"
read_verilog "top_tb.v"

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

set_property top ${sim_top} [get_filesets sim_1]
set_property include_dirs ${proj_dir} [get_filesets sim_1]
set_property simulator_language Mixed [current_project]
set_property verilog_define { {SIMULATION=1} } [get_filesets sim_1]
set_property -name xsim.more_options -value {-testplusarg TESTNAME=basic_test} -objects [get_filesets sim_1]
set_property runtime {} [get_filesets sim_1]
set_property target_simulator xsim [current_project]
set_property compxlib.compiled_library_dir {} [current_project]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

launch_simulation
run 600ns
