BUILD_HOME:=./build

MYCPU_HOME:=./mycpu_env/myCPU
MYCPU_SRC:=$(shell find $(MYCPU_HOME) -name "*.v")
MYCPU_SRC+=$(shell find $(MYCPU_HOME) -name "*.h")
MYCPU_IP:=$(shell find $(MYCPU_HOME) -name "*.xci")

SOC_AXI_HOME:=./mycpu_env/soc_verify/soc_axi/rtl
CONFREG_SRC:=$(SOC_AXI_HOME)/CONFREG/confreg.v

MYCPU_IP_HOME:=$(BUILD_HOME)/mycpu
IP_REPO_HOME:=$(BUILD_HOME)/ip_repo

.PHONY: clean mycpu_ip ip_repo

mycpu_ip: $(MYCPU_SRC) $(MYCPU_IP)
	@rm -rf $(MYCPU_IP_HOME)
	@vivado -mode tcl -source ./scripts/package_ip.tcl -notrace

confreg_ip: $(CONFREG_SRC)
	@vivado -mode tcl -source ./scripts/package_ip_confreg.tcl -notrace

ip_repo: mycpu_ip
	@mkdir -p $(IP_REPO_HOME)
	@cp $(MYCPU_IP_HOME)/*.zip $(IP_REPO_HOME)

clean:
	rm -rf ./vivado* $(IP_REPO_HOME)
