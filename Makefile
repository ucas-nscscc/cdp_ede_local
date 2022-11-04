IP_HOME:=./ip

MYCPU_HOME:=./src/myCPU
MYCPU_SRC:=$(shell find $(MYCPU_HOME) -name "*.v")
MYCPU_SRC+=$(shell find $(MYCPU_HOME) -name "*.h")
MYCPU_IP_SRC:=$(shell find $(MYCPU_HOME) -name "*.xci")

CONFREG_HOME:=./src/CONFREG
CONFREG_SRC:=$(CONFREG_HOME)/confreg.v

SCRIPTS_HOME:=./scripts

MYCPU_IP_HOME:=$(IP_HOME)/mycpu
CONFREG_IP_HOME:=$(IP_HOME)/confreg

.PHONY: clean mycpu_ip confreg_ip

# Generate ip core for mycpu and confreg
all: mycpu_ip confreg_ip

mycpu_ip: $(MYCPU_SRC) $(MYCPU_IP_SRC)
	@echo "Generating" $@
	@rm -rf $(MYCPU_IP_HOME)
	@echo "echo \"`cat $(SCRIPTS_HOME)/package_ip_template.tcl`\"" | \
		SOURCE_HOME=$(MYCPU_HOME) IP_PRJ_HOME=$(MYCPU_IP_HOME)  IP_SOURCE_HOME=$(MYCPU_HOME)/ip bash > \
		$(SCRIPTS_HOME)/tmp.tcl
	@vivado -mode tcl -source $(SCRIPTS_HOME)/tmp.tcl -nojournal -notrace
	@rm $(SCRIPTS_HOME)/tmp.tcl

confreg_ip: $(CONFREG_SRC)
	@echo "Generating" $@
	@rm -rf $(CONFREG_IP_HOME)
	@echo "echo \"`cat $(SCRIPTS_HOME)/package_ip_template.tcl`\"" | \
		SOURCE_HOME=$(CONFREG_HOME) IP_PRJ_HOME=$(CONFREG_IP_HOME)  IP_SOURCE_HOME=. bash > \
		$(SCRIPTS_HOME)/tmp.tcl
	@vivado -mode tcl -source $(SCRIPTS_HOME)/tmp.tcl -nojournal -notrace
	@rm $(SCRIPTS_HOME)/tmp.tcl

# Run vivado for mysoc
run_soc:
	@vivado ./mysoc/mysoc.xpr &

clean:
	rm -rf ./vivado*
