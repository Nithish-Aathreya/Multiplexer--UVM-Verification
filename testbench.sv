`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "seqitem.sv"
`include "mx_sequence.sv"
`include "mx_sequencer.sv"
`include "mx_driver.sv"
`include "mx_monitor.sv"
`include "mx_agent.sv"
`include "mx_scoreboard.sv"
`include "mx_environment.sv"
`include "test.sv"

module mx_top;
  
  mxintf intf();
  
  mux dut(.in(intf.in),.sel(intf.sel),.out(intf.out));
  
  initial
    begin
      uvm_config_db#(virtual mxintf)::set(null,"*","mxintf",intf);
    
    end
  
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars;
  end
  
  initial
    begin
      run_test("mx_test");
      
    end
  
endmodule
  
  
  
  
  
  
  
  

