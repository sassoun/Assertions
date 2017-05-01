`timescale 1ns/10ps
// prints out the state values
//
module dut(intf.idut ix);

default clocking @(posedge(ix.clk));

endclocking

always @(posedge(ix.clk)) begin
  $display(ix.state);
  
  assert property (ix.state==9 |=> ix.state==0);
  assert property (ix.state==0 |=> ix.state==1);
  assert property (ix.state==1 |=> ix.state inside {2,4});
  assert property (ix.state==2 |=> ix.state==3);
  assert property (ix.state==3 |=> ix.state inside {5,1});
  assert property (ix.state==4 |=> ix.state==5);
  assert property (ix.state==5 |=> ix.state inside {1,6});
  assert property (ix.state==6 |=> ix.state==7);
  assert property (ix.state==7 |=> ix.state inside {0,8});
  assert property (ix.state==8 |=> ix.state inside {2,4,10,9});
  assert property (ix.state==9 |=> ix.state==8);
  assert property (ix.state==10 |=> ix.state==0);
  
end
endmodule
