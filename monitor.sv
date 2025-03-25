class mx_monitor extends uvm_monitor;
  `uvm_component_utils(mx_monitor)
  
  seqitem tx;
  uvm_analysis_port#(seqitem) item_collected_port;
  virtual mxintf vif;
  
  function new(string name="mx_monitor", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    tx = seqitem::type_id::create("tx");
    if(!(uvm_config_db#(virtual mxintf)::get(this,"*","mxintf",vif))) 
      begin
        `uvm_fatal("config monitor" , "cannnot get");
      end
    item_collected_port=new("item_collected_port",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    #10
    repeat(8)
    begin
    tx.in<=vif.in;
    tx.out<=vif.out;
    tx.sel<=vif.sel;
    item_collected_port.write(tx);
    end
    
  endtask
  
endclass
    
