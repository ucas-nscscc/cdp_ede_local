# cdp_ede_local Advanced

This project is derived from the lab environment [`cdp_ede_local`](https://gitee.com/loongson-edu/cdp_ede_local?_from=gitee_search) of UCAS calab. Based on `cdp_ede_local`, we built a System-On-Chip (SOC), which project is located in `./mysoc`.

## Quick Start

We use the Block Design provided by Vivado to establish *mysoc*, and a `Makefile` is given to help. The following targets are supported:

- `all`: package *mycpu* and *confreg* from RTL code located in `./src` to IP cores, create project `mysoc` and run it with Vivado
- `mycpu_ip` and `confreg_ip`: package *mycpu* and *confreg* separately
- `create_mysoc`: create project `mysoc` and add necessary files for Block Design
- `run_mysoc`: open project *mysoc* with Vivado
- `clean`: clean Vivado jounral files
- `dist_clean`: also clean ip repo and `mysoc`

hint: put your RTL code of *mycpu* in `./src/myCPU` and IP cores in `./src/ip/*`.
