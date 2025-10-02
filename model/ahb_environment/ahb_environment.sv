class ahb_environment extends uvm_env;
  `uvm_component_utils(ahb_environment)

  function new(string name="ahb_environment", uvm_component parent);
    super.new(name,parent);
  endfunction: new
ahb_scoreboard ahb_sb;
ahb_agent cpu_agent;
ahb_agent spi_agent;
ahb_agent i2c_agent;
ahb_agent uart_agent;
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("build_phase","Entered...",UVM_HIGH)
	ahb_sb= ahb_scoreboard::type_id::create("ahb_sb",this);
	cpu_agent= ahb_agent::type_id::create("cpu_agent",this);
    spi_agent= ahb_agent::type_id::create("spi_agent",this);
    i2c_agent= ahb_agent::type_id::create("i2c_agent",this);
	uart_agent= ahb_agent::type_id::create("uart_agent",this);
    `uvm_info("build_phase","Exiting...",UVM_HIGH)
  endfunction: build_phase

endclass: ahb_environment