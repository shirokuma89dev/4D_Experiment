t=0:0.1:8;
tt=data.time; 
vv=data.values(:,2);
xx=data.values(:,3);

f=0;
x0=1;
v0=1;
k=10;
m=1;

omega=sqrt(k/m)

//理論式
x = (v0 / omega) * sin(omega * t) + x0 * cos(omega * t)
v = (v0) * cos(omega * t) - x0 * omega * sin(omega * t)

subplot(211) //速度
plot(tt,vv,'r',t,v,'+b','LineWidth', 2)
xgrid
set(gca(), "font_size", 4)
xlabel('t [sec]','fontname','helvetica',"fontsize",4);
ylabel('v [m/s]','fontname','helvetica',"fontsize",4);
legend('Simulation','Theory',3);


subplot(212) //位置
plot(tt,xx,'r',t,x,'+b','LineWidth', 2)
xgrid
set(gca(), "font_size", 4)
xlabel('t [sec]','fontname','helvetica',"fontsize",4);
ylabel('x [m]','fontname','helvetica',"fontsize",4);
legend('Simulation','Theory',3);

