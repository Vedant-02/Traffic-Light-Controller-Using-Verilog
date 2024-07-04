`timescale 1ns / 1ps

module traffic_light (clk, Pa, Pb, Pc, Pd, Ra_tmp, Rb_tmp, Rc_tmp, Rd_tmp, Ga_tmp, Gb_tmp, Gc_tmp, Gd_tmp, Ya_tmp, Yb_tmp, Yc_tmp, Yd_tmp);
input clk;
input Pa,Pb,Pc,Pd;
//inout Ra,Rb,Rc,Rd;
//inout Ga,Gb,Gc,Gd;
//inout Ya,Yb,Yc,Yd;
output reg Ra_tmp,Rb_tmp,Rc_tmp,Rd_tmp;
output reg Ga_tmp,Gb_tmp,Gc_tmp,Gd_tmp;
output reg Ya_tmp,Yb_tmp,Yc_tmp,Yd_tmp;
//output co;
//ClockDivider c1(clk, co);
reg[3:0] state;
reg[3:0] nextstate;
reg [27:0] count=0;
//parameter[1:0] R = 0;
//parameter[1:0] Y = 1;
//parameter[1:0] G = 2;
//wire[1:0] lightA;
//wire[1:0] lightB;
//wire[1:0] lightC;
//wire[1:0] lightD;
//assign Ra = Ra_tmp;
//assign Rb = Rb_tmp;
//assign Rc = Rc_tmp;
//assign Rd = Rd_tmp;
//assign Ga = Ga_tmp;
//assign Gb = Gb_tmp;
//assign Gc = Gc_tmp;
//assign Gd = Gd_tmp;
//assign Ya = Ya_tmp;
//assign Yb = Yb_tmp;
//assign Yc = Yc_tmp;
//assign Yd = Yd_tmp;
initial
begin
 state = 0;
end
always @(state or Pa or Pb or Pc or Pd)
begin
 Ra_tmp = 1'b0 ;
 Rb_tmp = 1'b0 ;
 Rc_tmp = 1'b0 ;
 Rd_tmp = 1'b0 ;
 Ga_tmp = 1'b0 ;
 Gb_tmp = 1'b0 ;
 Gc_tmp = 1'b0 ;
 Gd_tmp = 1'b0 ;
 Ya_tmp = 1'b0 ;
 Yb_tmp = 1'b0 ;
 Yc_tmp = 1'b0 ;
 Yd_tmp = 1'b0 ;
 nextstate = 0;
 case (state)
 0, 1 :
 begin
 Rb_tmp = 1'b1 ;
 Rd_tmp = 1'b1 ;
 Ga_tmp = 1'b1 ;
 Rc_tmp = 1'b1 ;
 nextstate = state + 1;
 end
 2 :
 begin
 Rb_tmp = 1'b1 ;
 Rd_tmp = 1'b1 ;
 Ga_tmp = 1'b1 ;
 Rc_tmp = 1'b1 ;
 if (Pb==1'b0 && Pc==1'b0 && Pd==1'b0 && Pa==1'b1)
 begin
 nextstate = 2;
 end
 else if(Pb==1'b1)
 begin
 nextstate = 3;
 end 
 else if(Pc==1'b1)
 begin 
 nextstate = 7;
 end
 else if(Pd==1'b1)
 begin 
 nextstate = 11;
 end
 else 
 begin
 nextstate = 3;
 end
 end
 3 :
 begin
 Ya_tmp = 1'b1 ;
 Ga_tmp = 1'b0 ;
 Rc_tmp = 1'b1 ;
 Rb_tmp = 1'b1 ;
 Rd_tmp = 1'b1 ;
 nextstate = 4 ;
 end
 4,5 :
 begin
 Gb_tmp = 1'b1 ;
 Ya_tmp = 1'b0 ;
 Rd_tmp = 1'b1 ;
 Ra_tmp = 1'b1 ;
 Rc_tmp = 1'b1 ;
 nextstate = state + 1;
 end
 6 :
 begin
 Gb_tmp = 1'b1 ;
 Rd_tmp = 1'b1 ;
 Ra_tmp = 1'b1 ;
 Rc_tmp = 1'b1 ;
 if (Pa==1'b0 && Pb==1'b1 && Pc==1'b0 && Pd==1'b0)
 begin
 nextstate = 6;
 end 
 else if(Pc==1'b1)
 begin
 nextstate = 7;
 end 
 else if(Pd==1'b1)
 begin 
 nextstate = 11;
 end
 else if(Pa==1'b1)
 begin 
 nextstate = 15;
 end
 else begin 
 nextstate = 7;
 end
 end
 7 :
 begin
 Ra_tmp = 1'b1 ;
 Rc_tmp = 1'b1 ;
 Yb_tmp = 1'b1 ;
 Gb_tmp = 1'b0 ;
 Rd_tmp = 1'b1 ;
 nextstate = 8 ;
 end
 8,9 :
 begin
 Rb_tmp = 1'b1 ;
 Rd_tmp = 1'b1 ;
 Ra_tmp = 1'b1 ;
 Yb_tmp = 1'b0 ;
 Gc_tmp = 1'b1 ;
 nextstate = state + 1 ;
 end
 10 :
 begin
 Gc_tmp = 1'b1 ;
 Rd_tmp = 1'b1 ;
 Ra_tmp = 1'b1 ;
 Rb_tmp = 1'b1 ;
 if (Pa==1'b0 && Pb==1'b0 && Pc==1'b1 && Pd==1'b0)
 begin
 nextstate = 10;
 end 
 else if(Pd==1'b1)
 begin
 nextstate = 11;
 end 
 else if(Pb==1'b1)
 begin
 nextstate = 3;
 end 
 else if(Pa==1'b1)
 begin 
 nextstate = 15;
 end
 else begin 
 nextstate = 11;
 end
 end
 11 :
 begin
 Ra_tmp = 1'b1;
 Yc_tmp = 1'b1;
 Rb_tmp = 1'b1;
 Rd_tmp = 1'b1;
 Gc_tmp = 1'b0;
 nextstate = 12;
 end
 12,13 :
 begin
 Rb_tmp = 1'b1 ;
 Gd_tmp = 1'b1 ;
 Ra_tmp = 1'b1 ;
 Rc_tmp = 1'b1 ;
 Yc_tmp = 1'b0;
 nextstate = state + 1 ;
 end
 14 :
 begin
 Rb_tmp = 1'b1 ;
 Gd_tmp = 1'b1 ;
 Ra_tmp = 1'b1 ;
 Rc_tmp = 1'b1 ;
 if (Pa==1'b0 && Pb==1'b0 && Pc==1'b0 && Pd==1'b1)
 begin
 nextstate = 14;
 end 
 else if(Pa==1'b1)
 begin
 nextstate = 15;
 end
 else if(Pb==1'b1)
 begin
 nextstate = 3;
 end 
 else if(Pc==1'b1)
 begin 
 nextstate = 7;
 end
 else begin 
 nextstate = 15;
 end
 end
 15 :
 begin
 Ra_tmp = 1'b1;
 Rc_tmp = 1'b1;
 Rb_tmp = 1'b1;
 Yd_tmp = 1'b1;
 Gd_tmp = 1'b0;
 nextstate = 0;
 end
 endcase
end
always @(posedge clk)

begin
 state <= nextstate ;
end

//always@(posedge clk)
//begin
//   count = count + 1;
//end
//assign co = count[27];
//assign lightA = (Ra_tmp==1'b1) ? R : (Ya_tmp==1'b1) ? Y : (Ga_tmp==1'b1) ? G : lightA;
//assign lightB = (Rb_tmp==1'b1) ? R : (Yb_tmp==1'b1) ? Y : (Gb_tmp==1'b1) ? G : lightB;
//assign lightC = (Rc_tmp==1'b1) ? R : (Yc_tmp==1'b1) ? Y : (Gc_tmp==1'b1) ? G : lightC;
//assign lightD = (Rd_tmp==1'b1) ? R : (Yd_tmp==1'b1) ? Y : (Gd_tmp==1'b1) ? G : lightD;
endmodule

