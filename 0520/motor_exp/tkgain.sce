close(); //表示グラフを閉じる
ts = 0.02;


t=data.time; 
u=data.values(:,1);
y=data.values(:,2);

u1 = mean(u(150:250));
u2 = mean(u(400:500));
y1 = mean(y(150:250));
y2 = mean(y(400:500));



K = (y2-y1)/(u2-u1);
yt = (y2-y1)*0.632+y1;
n = min( find( y > yt ) );
T = t(n) - 5;
offset = ( K*u1 - y1 )/K;

//グラフへ表示
plot(t,y,'r','LineWidth',4)
xgrid
plot([0,500]*ts,[y1,y1],'b--',...
    'LineWidth',4)
plot([0,500]*ts,[y2,y2],'b--',...
    'LineWidth',4)
plot([0,500]*ts,[yt,yt],'b--',...
    'LineWidth',4)

// 軸のフォント・サイズ変更
set(gca(),'font_size',4)
// Xラベルのフォント・サイズ変更
xlabel('Time [sec]','fontname','helvetica', "fontsize", 4);
// Yラベルのフォント・サイズ変更
ylabel('Velocity [V]','fontname','helvetica', "fontsize", 4);
