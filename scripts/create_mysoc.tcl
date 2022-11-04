create_project -force ./mysoc ./mysoc -part xc7a200tfbg676-1

set_property ip_repo_paths {./ip} [current_project]
update_ip_catalog

add_files [glob -nocomplain ./src/mysoc/bd/*.bd]

add_files ./src/mysoc/mysoc_top.v

add_files -fileset constrs_1 ./src/mysoc/constr
