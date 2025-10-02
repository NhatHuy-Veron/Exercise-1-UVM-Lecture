class ahb_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(ahb_scoreboard)

  function new(string name="ahb_scoreboard", uvm_component parent);
    super.new(name,parent);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("build_phase","Entered...",UVM_HIGH)
    `uvm_info("build_phase","Exited...",UVM_HIGH)
  endfunction: build_phase

  virtual task run_phase(uvm_phase phase);
  endtask: run_phase

endclass: ahb_scoreboard