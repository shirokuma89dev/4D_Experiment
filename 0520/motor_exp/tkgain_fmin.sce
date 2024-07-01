//tkgain_fmin.sce
function J = myfunc(x,yy,tt,r)
// x  = [K,T] <- 初期値x0から求める
// yy = ステップ応答の実験値[deg]
// tt = ステップ応答の時間[sec]
// r  = 目標角度[deg]
 K=x(1);
 T=x(2);
 s=poly(0,'s');
 G=K/(T*s+1)*r; //伝達関数計算
 sys=syslin('c',G);
 ysim=csim('step',tt,sys);//ステップ応答計算
 plot(tt,ysim,'k')
 J=norm(yy-ysim);         //誤差
endfunction

close();
tt=t(251:450)'-t(251); //t=5-10[sec] -> tt=0-5[sec]
yy=y(251:450)'-y(251);
plot(tt,yy,'b','LineWidth',3)
r=1;//入力電圧[V]
x0=[1,1]; //[K,T]の初期値
[x fval]=fminsearch(list(myfunc,yy,tt,r),x0);

//評価
K=x(1);
T=x(2);
s=poly(0,'s');
G=K/(T*s+1)*r;
sys=syslin('c',G);
ysim=csim('step',tt,sys);
plot(tt,yy,'b',tt,ysim,'r+','LineWidth',3)
xgrid
// 軸のフォント・サイズ変更
set(gca(),'font_size',4)
// Xラベルのフォント・サイズ変更
xlabel('Time [s]','fontname','helvetica',"fontsize",4);
// Yラベルのフォント・サイズ変更
ylabel('Velocity [V]','fontname','helvetica',"fontsize",4);
// 凡例
//legend('Experiment','Identification',4);
