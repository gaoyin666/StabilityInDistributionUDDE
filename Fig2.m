clear;
tau=1;
alpha=0.8;
q=(sqrt(3)/pi)*log(alpha/(1-alpha));
ddex1dez = @(t,y,Z) (exp(-t)*y+(1/(1+t^2)*Z(1,1)))+abs((1/2)*t*exp(-t)*y+(pi/(2*sqrt(3)))*t*exp(-(t^2))*Z(1,1))*q;
 %y(1)表示x_1(t)，因为dde求解的结果中sol会有个x，为了区别用y(1)表示x_1(t)；Z(1,1)表示时滞项x_1(t-0.1)；Z(1,2)表示时滞项x_1(t-0.3)
sol1 = dde23(ddex1dez,[1, 0.3],0.1,[0,20]);%dde23(@....,tau,history,tspan); %[0.1, 0.3]是时滞，[2 2]是初值，[0, 50]是时间范围
sol2 = dde23(ddex1dez,[1, 0.3],0.14,[0,20]);
sol3 = dde23(ddex1dez,[1, 0.3],0.15,[0,20]);
sol4 = dde23(ddex1dez,[1, 0.3],0.18,[0,20]);
sol5 = dde23(ddex1dez,[1, 0.3],0.19,[0,20]);
plot(sol1.x,sol1.y,'--pk');
hold on
plot(sol2.x,sol2.y,'--*r');
hold on
plot(sol3.x,sol3.y,'--dg');
hold on
plot(sol4.x,sol4.y,'--+b');
hold on
plot(sol5.x,sol5.y,'--om');
hold off
grid on;
xlabel('Time t');
ylabel('U_t','rotation',360);
legend('h=0.1','h=0.14','h=0.15','h=0.18','h=0.19');

