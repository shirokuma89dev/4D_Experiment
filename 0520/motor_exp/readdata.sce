close(); //表示グラフを閉じる
//data=read_csv('data08.csv');
//data=evstr(data);
t=data(:,1);
u=data(:,2);
y=data(:,3);

um=mean(u(176:250))
ym=mean(y(176:250))
h=sprintf('%5.2f,%5.4f;',um,ym)

plot(t,u,'b',t,y,'r','LineWidth',2)
xgrid
// 軸のフォント・サイズ変更
set(gca(),'font_size',4)
// Xラベルのフォント・サイズ変更
xlabel('Time [sec]','fontname','helvetica', "fontsize", 4);
// Yラベルのフォント・サイズ変更
ylabel('Voltage [V]','fontname','helvetica', "fontsize", 4);
// 凡例
legend('入力電圧u[V]','出力電圧y[V]',4);
