class mx_test extends uvm_test;
  `uvm_component_utils(mx_test)
  
  mx_environment env;
  mx_sequence seq;
  
  function new(string name="mx_test", uvm_component parent);
    super.new(name,parent);
  endfunction
  
   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     env = mx_environment::type_id::create("env",this);
     seq = mx_sequence::type_id::create("seq",this);
   endfunction
  
  virtual function void end_of_elaboration();
    `uvm_info("mx_test","elaboration",UVM_MEDIUM)
    print();
  endfunction
  
  task run_phase(uvm_phase phase);
    begin
      phase.raise_objection(this);
      seq.start(env.agent.seqr);
      phase.drop_objection(this);
    end
    
    
  
  endtask
  
endclass
