class mx_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(mx_scoreboard)
  
  uvm_analysis_imp#(seqitem,mx_scoreboard) item_collected_export;
  seqitem tx;
  
  
  
  function new(string name="mx_scoreboard", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    item_collected_export=new("item_collected_export",this);
  endfunction
  
  
  virtual function void write(seqitem t);
    tx = t;
    fork
      check_result(tx);
    join_none
      endfunction
  
   task check_result(seqitem tr);
    $display("///////////////////////////////// ::: TEST RESULTS ::: /////////////////////////////////");

    if (tr.sel == 3'b000)
      begin
      if ((tr.in[0] == 1) && (tr.out == 1)) 
        $display("/////////// TEST RESULT : Test Pass ");
      else 
        $display("/////////// TEST RESULT : Test Fail for Select Line = %3b", tr.sel);
    end


  

  endtask
  
endclass
