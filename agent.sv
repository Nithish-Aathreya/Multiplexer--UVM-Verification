class mx_agent extends uvm_agent;
  `uvm_component_utils(mx_agent)
  
  mx_sequencer seqr;
  mx_driver driv;
  mx_monitor mon;
  
  
  function new(string name="mx_agent", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  
   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     seqr = mx_sequencer::type_id::create("seqr",this);
     driv=mx_driver::type_id::create("driv",this);
     mon=mx_monitor::type_id::create("mon",this);
   endfunction
     
     function void connect_phase(uvm_phase phase);
       super.connect_phase(phase);
       driv.seq_item_port.connect(seqr.seq_item_export);
   
  endfunction
     
     endclass
