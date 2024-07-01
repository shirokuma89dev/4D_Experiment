t=data.time; 
u=data.values(:,1);
y=data.values(:,2);
r=data.values(:,3);
write_csv([t,u,y,r],'data00.csv',',','.')

close(); //表示グラフを閉じる
plot(t,u,'b',t,y,'r',t,r,'k','LineWidth',2)
xgrid
// 軸のフォント・サイズ変更
set(gca(),'font_size',4)
// Xラベルのフォント・サイズ変更
xlabel('Time [sec]','fontname','helvetica', "fontsize", 4);
// Yラベルのフォント・サイズ変更
ylabel('Voltage [V]','fontname','helvetica', "fontsize", 4);
// 凡例
legend('入力電圧u[V]','出力速度y[V]','目標速度r[V]',4);
