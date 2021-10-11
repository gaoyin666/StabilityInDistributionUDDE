N=1000;
r=0.7;
a=0.2;
tau=0.7;
alpha=0.65;
q=(sqrt(3)/pi)*log(alpha/(1-alpha));
ddex1dez = @(t,y,Z) (exp(-r*t))*r*y*(1-(Z(1,1)/N))+(exp(-a*t))*q*y;
 %y(1)表示x_1(t)，因为dde求解的结果中sol会有个x，为了区别用y(1)表示x_1(t)；Z(1,1)表示时滞项x_1(t-0.1)；Z(1,2)表示时滞项x_1(t-0.3)
sol1 = dde23(ddex1dez,[0.7, 0.3],0.35,[0,50]);%dde23(@....,tau,history,tspan); %[0.1, 0.3]是时滞，[2 2]是初值，[0, 50]是时间范围
sol2 = dde23(ddex1dez,[0.7, 0.3],0.45,[0,50]);
sol3 = dde23(ddex1dez,[0.7, 0.3],0.5,[0,50]);
sol4 = dde23(ddex1dez,[0.7, 0.3],0.65,[0,50]);
sol5 = dde23(ddex1dez,[0.7, 0.3],0.8,[0,50]);
figure;
plot(sol1.x,sol1.y,'--ok')
hold on
plot(sol2.x,sol2.y,'--+r')
hold on
plot(sol3.x,sol3.y,'--*g')
hold on
plot(sol4.x,sol4.y,'--db')
hold on
plot(sol5.x,sol5.y,'--pm')
hold off
grid on;
% plot(sol.x,sol.y(1,:) )
% hold on
% plot(sol.x,sol.y(2,:),'-.' )
% 
xlabel('Time t');
ylabel('P_t','rotation',360);
legend('h=0.35','h=0.45','h=0.5','h=0.65','h=0.8');


