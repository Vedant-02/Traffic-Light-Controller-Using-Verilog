`timescale 1ns / 1ps


module Test_bench_Traffic_Light();
reg Pa,Pb,Pc,Pd;
reg clk;

wire Ra_tmp,Rb_tmp,Rc_tmp,Rd_tmp,Ga_tmp,Gb_tmp,Gc_tmp,Gd_tmp,Ya_tmp,Yb_tmp,Yc_tmp,Yd_tmp,co;

traffic_light t1(clk, co, Pa, Pb, Pc, Pd, Ra_tmp, Rb_tmp, Rc_tmp, Rd_tmp, Ga_tmp, Gb_tmp, Gc_tmp, Gd_tmp, Ya_tmp, Yb_tmp, Yc_tmp, Yd_tmp);

initial begin
    Pa = 0;
    Pb = 1;
    Pc = 0;
    Pd = 0;
    #70 Pd=1; Pb=0;
    #90 Pc=1; Pd=0;
    #70 Pa=1; Pc=0;
    #50 Pa=0; 
end
initial #500 $finish;
initial begin 
clk = 0;
end
always #10 clk = ~clk;
endmodule
