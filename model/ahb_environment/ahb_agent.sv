class ahb_agent extends uvm_agent;
  `uvm_component_utils(ahb_agent)

  function new(string name="ahb_agent", uvm_component parent);
    super.new(name,parent);
  endfunction: new
ahb_sequencer m_sequencer;
ahb_driver m_driver;
ahb_monitor m_monitor;
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	`uvm_info ("build_phase","Entered...", UVM_HIGH)
	m_sequencer= ahb_sequencer::type_id::create ("ahb_sequencer",this);
	m_driver= ahb_driver::type_id::create ("ahb_driver",this);
	m_monitor= ahb_monitor::type_id::create ("ahb_monitor",this);
	`uvm_info ("build_phase","Exiting...", UVM_HIGH)
  endfunction: build_phase

endclass: ahb_agent