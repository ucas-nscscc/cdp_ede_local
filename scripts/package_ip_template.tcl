# Create IP Project
create_project -force $IP_PRJ_HOME $IP_PRJ_HOME -part xc7a200tfbg676-1

# Add IPs
add_files -quiet [glob -nocomplain $IP_SOURCE_HOME/*/*.xci]

# Add myCPU
add_files -scan_for_includes $SOURCE_HOME

update_compile_order -fileset sources_1

# Create Temp Project
ipx::package_project -root_dir $IP_PRJ_HOME -vendor user.org -library user -taxonomy /UserIP -import_files -set_current false -force
ipx::unload_core $IP_PRJ_HOME/component.xml
ipx::edit_ip_in_project -upgrade true -name tmp_edit_project -directory $IP_PRJ_HOME $IP_PRJ_HOME/component.xml

# Add Parameters
update_compile_order -fileset sources_1
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces interface_aximm -of_objects [ipx::current_core]]

# Generate IP Descripton Files
set_property core_revision 2 [ipx::current_core]
ipx::update_source_project_archive -component [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
ipx::check_integrity -quiet [ipx::current_core]
ipx::archive_core $IP_PRJ_HOME/user.org_user_mycpu_top_1.0.zip [ipx::current_core]
ipx::move_temp_component_back -component [ipx::current_core]
close_project -delete

# set_property  ip_repo_paths  {/home/haooops/Documents/cdp_ede_local/ip/mycpu /home/haooops/Documents/cdp_ede_local/ip/ip_repo} [current_project]
# update_ip_catalog

exit
