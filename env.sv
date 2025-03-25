class mx_environment extends uvm_env;
  `uvm_component_utils(mx_environment)
  
  mx_agent agent;
  mx_scoreboard scb;
  
   function new(string name="mx_environment", uvm_component parent);
    super.new(name,parent);
  endfunction
  
   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     agent = mx_agent::type_id::create("agent",this);
     scb=mx_scoreboard::type_id::create("scb",this);
   endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    agent.mon.item_collected_port.connect(scb.item_collected_export);
    
  endfunction
  
endclass
