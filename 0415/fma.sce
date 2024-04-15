t=0:0.1:8;
tt=data.time; 
vv=data.values(:,1);
xx=data.values(:,2);

//理論式
g=-9.8
v=g*t+v0;
x=v0*t+(1/2)*g*t^2+x0
close(); //表示グラフを閉じる

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
ylabel('v [m/s]','fontname','helvetica',"fontsize",4);
legend('Simulation','Theory',3);

