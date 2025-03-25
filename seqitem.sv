class seqitem extends uvm_sequence_item;
  `uvm_object_utils(seqitem)
  
  rand logic [7:0]in;
  rand logic [2:0]sel;
  logic out;
  
  
  
  
  function new(string name = "seqitem");
    super.new(name);
  endfunction
  
  

  
endclass
