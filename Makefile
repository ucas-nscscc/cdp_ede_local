IP_HOME:=./ip

SRC_HOME:=./src

MYCPU_HOME:=$(SRC_HOME)/mycpu
MYCPU_SRC:=$(shell find $(MYCPU_HOME) -name "*.v")
MYCPU_SRC+=$(shell find $(MYCPU_HOME) -name "*.h")
MYCPU_IP_SRC:=$(shell find $(MYCPU_HOME) -name "*.xci")

CONFREG_HOME:=$(SRC_HOME)/CONFREG
CONFREG_SRC:=$(CONFREG_HOME)/confreg.v

MYSOC_HOME:=$(SRC_HOME)/mysoc

SCRIPTS_HOME:=./scripts

MYCPU_IP_HOME:=$(IP_HOME)/mycpu
CONFREG_IP_HOME:=$(IP_HOME)/confreg
MYSOC_PRJ_HOME:=./mysoc

.PHONY: clean dist_clean

# Generate ip core for mycpu and confreg
all: create_mysoc run_mysoc

ip_repo: mycpu_ip confreg_ip

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
create_mysoc: ip_repo
	@vivado -mode tcl -source $(SCRIPTS_HOME)/create_mysoc.tcl -nojournal

run_mysoc: $(MYSOC_PRJ_HOME)/mysoc.xpr
	@vivado $<

clean:
	rm -rf ./vivado*

dist_clean: clean
	rm -rf $(MYSOC_PRJ_HOME) $(IP_HOME)
