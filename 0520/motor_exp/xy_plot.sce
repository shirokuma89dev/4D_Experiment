//xy_plot.sce
data=[
0.60,0.0611;
0.80,0.3962;
1.00,0.7316;
1.20,0.9718;
1.40,1.2976;
1.60,1.4678;
1.80,1.6038;
2.00,1.7009;
2.20,1.8752;
2.40,1.9257;
];
x=data(:,1);
y=data(:,2);

//最小二乗法
N = length(x);
X = [x,ones(N,1)];
Y = y;
A=inv(X'*X)*X'*Y;
K=A(1);
b=A(2);
offset=-b/K;

//最小二乗法の確認
xx=[0:3];
yy=K*xx+b;

close()
plot(xx,yy,'b',x,y,'ro','LineWidth',2)
xgrid
//軸のフォント・サイズ変更
set(gca(),'font_size',4)
//Xラベル
xlabel('Input: u[V]','fontname','helvetica',"fontsize",4);
//Yラベル
ylabel('Output: ω[V]','fontname','helvetica',"fontsize",4);
