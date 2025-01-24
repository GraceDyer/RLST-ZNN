clear;
clc;
close all;

tic();
startup_rvc 
global px;
global py;
global pz;
global alpha; 
global d; 
global a;
global tool_robot;

duration = 6;

px = 0.467;%0.476;
py = -0.15;%-0.26;%-0.15;
pz = 0.57;%0.609;%0.57;

a=[0,-0.42500,-0.39225,0,0,0];
d=[0.089459,0,0,0.10915,0.09465,0.08230];
alpha = [pi/2, 0, 0, pi/2, -pi/2, 0];

L1 = Link('d', d(1),  'a', a(1), 'alpha', alpha(1), 'qlim',[-60/180*pi,60/180*pi], 'standard');
L2 = Link('d', d(2),  'a', a(2), 'alpha', alpha(2), 'qlim',[-180/180*pi,180/180*pi], 'standard');
L3 = Link('d', d(3),  'a', a(3), 'alpha', alpha(3), 'qlim',[-180/180*pi,180/180*pi], 'standard');
L4 = Link('d', d(4),  'a', a(4), 'alpha', alpha(4), 'qlim',[-180/180*pi,180/180*pi], 'standard');
L5 = Link('d', d(5),  'a', a(5), 'alpha', alpha(5), 'qlim',[-180/180*pi,180/180*pi], 'standard');
L6 = Link('d', d(6),  'a', a(6), 'alpha', alpha(6), 'qlim',[-180/180*pi,180/180*pi], 'standard');


tool_robot = SerialLink([L1,L2,L3,L4,L5,L6], 'name', 'UR5','base', transl(0,0,0.4));
tool_robot.display();

options=odeset('RelTol',10^(-5),'AbsTol',10^(-5));
tspan = [0 duration];

 x0 = [0, -pi/3, -pi/2, 0, pi/5, 0];Tp=0.75;
 y0 = [x0,zeros(1,3)]

[t,x] = ode45(@RLST_ZNN,tspan,y0,options,Tp);

jj = 0;
epsilon = 0;
interval = 0.0050;
for ii=1:length(t)
    if(t(ii,1)>=epsilon) 
        jj=jj+1;
        tn(jj,1)=t(ii,1);
        xn(jj,:)=x(ii,:);
        epsilon=tn(jj,1)+interval; 
    elseif(ii==length(t))
        jj=jj+1;
        tn(jj,1)=t(ii,1);
        xn(jj,:)=x(ii,:);
    end
end
clear t x;  
t=tn;

x=xn(:,1:6);
len=length(t);

p_end = zeros(len,3);
desired_p_end=zeros(len,3);
for ii=1:length(t)
    para = x(ii,:);
    p_end(ii,:)=myfkine(para, d, a, alpha).';
    desired_p_end(ii,:)=desired_path(t(ii)).';
    err_end(ii,:)=desired_p_end(ii,:)-p_end(ii,:);
    err_norm(ii)=norm(err_end(ii,:));
end

hint='fig1'
figure(1);
plot(t,err_norm,'-','Color',[0 0.447 0.741],'LineWidth',2);hold on
scatter(Tp,0,[],[1.0000,0,0],'filled');
legend({'errorend','Tp'},'FontSize',10);
text(1,0.08,'err');
text(2,0.08,'t');

hint='fig3'
figure(3);
plot(desired_p_end(:,2),desired_p_end(:,3),'r','LineWidth',2);hold on;
plot(p_end(:,2),p_end(:,3),'b--','LineWidth',2);
legend({'desired path','actural path'},'FontSize',10);
text(-0.3,0.7,'Z');
text(-0.1,0.4,'Y');

hint='fig2'
figure(2);
plot3(p_end(:,1),p_end(:,2),p_end(:,3),'r','LineWidth',1);
set(gca,'zTickLabel',num2str(get(gca,'zTick')','%.2f'));
err_norm=norm(err_end)


hint='fig4'
figure(4);
plot(t,x(:,1),'r','LineWidth',2);hold on
plot(t,x(:,2),'g--','LineWidth',2);hold on
plot(t,x(:,3),'b:','LineWidth',2);hold on
plot(t,x(:,4),'y','LineWidth',2);hold on
plot(t,x(:,5),'m--','LineWidth',2);hold on
plot(t,x(:,6),'c:','LineWidth',2);
text(1,1,'t');
text(2,1,'rad');
legend({'q1','q2','q3','q4','q5','q6'},'FontSize',10)

hint='fig5'
for ii=1:len-1
    delt_t=t(ii+1)-t(ii);
    v(ii,:)=(x(ii+1,:)-x(ii,:))/delt_t;
end
figure(5);
plot(t(1:len-1),v(:,1),'r','LineWidth',2);hold on;
plot(t(1:len-1),v(:,2),'g--','LineWidth',2);hold on;
plot(t(1:len-1),v(:,3),'b:','LineWidth',2);hold on;
plot(t(1:len-1),v(:,4),'y','LineWidth',2);hold on;
plot(t(1:len-1),v(:,5),'m--','LineWidth',2);hold on;
plot(t(1:len-1),v(:,6),'c:','LineWidth',2);
text(1,1,'t');
text(2,1,'rads');
legend({'$\dot{\theta}_{1}$','$\dot{\theta}_{2}$','$\dot{\theta}_{3}$','$\dot{\theta}_{4}$','$\dot{\theta}_{5}$','$\dot{\theta}_{6}$'},'Interpreter', 'latex','FontSize',10)


figure(6);
hint='fig6'
L={'r', 'LineWidth', 2};
tool_robot.plot(x,'trail',L);

toc();
