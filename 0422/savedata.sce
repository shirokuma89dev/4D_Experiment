close(); //表示グラフを閉じる
t=data.time; 
u=data.values(:,1);
y=data.values(:,2);
plot(t,u,'b',t,y,'r')
xgrid
write_csv([t,u,y],'data1.csv',',','.')
