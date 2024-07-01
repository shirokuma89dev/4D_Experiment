T=0.48;//時定数[sec]
K=0.9421910;//ゲイン定数[回転速度/入力電圧]
offset=0.0540832;//オフセット電圧[V]

//手動
//Kp=0;
//Ki=8;

//極指定
//p1=-4;
//p2=-4;
//p1=-3+3*%i;
//p2=-3-3*%i;
//Kp=real(-((p1+p2)*T+1)/K);
//Ki=real(p1*p2*T/K);

//固有振動数，減衰比指定
zeta=0.7;
omega_n=3;
Kp=(2*zeta*omega_n*T-1)/K;
Ki=omega_n^2*T/K;

a=1;
b=(K*Kp+1)/T;
c=K*Ki/T;
p1=(-b+sqrt(b^2-4*a*c))/2/a;
p2=(-b-sqrt(b^2-4*a*c))/2/a;
