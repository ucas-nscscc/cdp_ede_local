create_project -force mycpu ./build/mycpu -part xc7a200tfbg676-1

# Add conventional sources
# add_files -scan_for_includes ../rtl

# Add IPs
add_files -quiet [glob -nocomplain ./mycpu_env/myCPU/ip/*/*.xci]

# Add simulation files
# add_files -fileset sim_1 ../testbench

# Add myCPU
add_files -scan_for_includes ./mycpu_env/myCPU

# Add constraints
# add_files -fileset constrs_1 -quiet ./constraints

update_compile_order -fileset sources_1

# set_property -name "top" -value "tb_top" -objects  [get_filesets sim_1]
# set_property -name "xsim.simulate.log_all_signals" -value "1" -objects [get_filesets sim_1]

ipx::package_project -root_dir /home/haooops/Documents/cdp_ede_local/build/mycpu -vendor user.org -library user -taxonomy /UserIP -import_files -set_current false -force
ipx::unload_core /home/haooops/Documents/cdp_ede_local/build/mycpu/component.xml
ipx::edit_ip_in_project -upgrade true -name tmp_edit_project -directory /home/haooops/Documents/cdp_ede_local/build/mycpu /home/haooops/Documents/cdp_ede_local/build/mycpu/component.xml

update_compile_order -fileset sources_1
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces interface_aximm -of_objects [ipx::current_core]]

set_property core_revision 2 [ipx::current_core]
ipx::update_source_project_archive -component [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
ipx::check_integrity -quiet [ipx::current_core]
ipx::archive_core /home/haooops/Documents/cdp_ede_local/build/mycpu/user.org_user_mycpu_top_1.0.zip [ipx::current_core]
ipx::move_temp_component_back -component [ipx::current_core]
close_project -delete

set_property  ip_repo_paths  {/home/haooops/Documents/cdp_ede_local/build/mycpu /home/haooops/Documents/cdp_ede_local/build/ip_repo} [current_project]
update_ip_catalog

exit
