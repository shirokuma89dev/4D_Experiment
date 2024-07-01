t=data.time; 
u=data.values(:,1);
y=data.values(:,2);
write_csv([t,u,y,],'data00.csv',',','.')

um=mean(u(176:250))
ym=mean(y(176:250))
h=sprintf('%5.2f,%5.4f;',um,ym)

close(); //表示グラフを閉じる
plot(t,u,'b',t,y,'r','LineWidth',2)
xgrid
// 軸のフォント・サイズ変更
set(gca(),'font_size',4)
// Xラベルのフォント・サイズ変更
xlabel('Time [sec]','fontname','helvetica', "fontsize", 4);
// Yラベルのフォント・サイズ変更
ylabel('Voltage [V]','fontname','helvetica', "fontsize", 4);
// 凡例
legend('u[V]','ω[V]',4);
