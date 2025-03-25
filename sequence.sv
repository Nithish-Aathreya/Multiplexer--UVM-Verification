class mx_sequence extends uvm_sequence#(seqitem);
  `uvm_object_utils(mx_sequence)
  seqitem tx;
  int i;
  
  function new(string name = "mx_sequence");
    super.new(name);
  endfunction
  
  task body();
     tx=seqitem::type_id::create("tx");
    
    tx.in = 8'b0;
    tx.sel=3'b0;
    repeat(8)
      begin
   
    start_item(tx);
   tx.in = 2**i;
        finish_item(tx);
      
    #10
    tx.sel = tx.sel + 1;
    i = i +1;
      end
    
        endtask
    
  endclass


  
