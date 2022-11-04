IP_HOME:=./ip

MYCPU_HOME:=./mycpu_env/myCPU
MYCPU_SRC:=$(shell find $(MYCPU_HOME) -name "*.v")
MYCPU_SRC+=$(shell find $(MYCPU_HOME) -name "*.h")
MYCPU_IP:=$(shell find $(MYCPU_HOME) -name "*.xci")

SOC_AXI_HOME:=./mycpu_env/soc_verify/soc_axi/rtl
CONFREG_SRC:=$(SOC_AXI_HOME)/CONFREG/confreg.v

MYCPU_IP_HOME:=$(IP_HOME)/mycpu
CONFREG_IP_HOME:=$(IP_HOME)/confreg

.PHONY: clean mycpu_ip

mycpu_ip: $(MYCPU_SRC) $(MYCPU_IP)
	@rm -rf $(MYCPU_IP_HOME)
	@vivado -mode tcl -source ./scripts/package_ip.tcl -notrace

confreg_ip: $(CONFREG_SRC)
	@rm -rf $(CONFREG_IP_HOME)
	@vivado -mode tcl -source ./scripts/package_ip_confreg.tcl -notrace

clean:
	rm -rf ./vivado*
