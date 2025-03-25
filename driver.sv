class mx_driver extends uvm_driver#(seqitem);
  `uvm_component_utils(mx_driver)
  
  virtual interface mxintf vif;
  seqitem tx;
  
  function new(string name="mx_driver", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual mxintf)::get(this,"*","mxintf",vif)))
      begin
        `uvm_fatal("config driver" , "cannnot get");
      end
    
  endfunction
  
  task run_phase(uvm_phase phase);
    
    repeat(8)
      begin
        tx = seqitem::type_id::create("tx");
      seq_item_port.get_next_item(tx);
      drive();
      seq_item_port.item_done();
 
      end
      endtask
  
  task drive();
    begin
      vif.in<=tx.in;
      vif.sel<=tx.sel;
    end
  endtask
  
  
endclass
