
function diff_theta = lyw_ZNN(t,x,Tp)
    if nargin==2, Tp=0.75;
    end
    global tool_robot;

    global alpha;
    global d;
    global a;
    angel=x(1:6);
    y=x(7:end);
    J = ur5_jacob(angel);
    [m,n]=size(J);
    J_left = [J,zeros(3,3);
        zeros(3,6),eye(3)];

    dp = diff_path(t);

    err = error_path(t,angel,d,a,alpha);

    gamma=3;
    T=0.1;
    noise=-0.2*(0.1*sin(2*pi/T*t+1)+0.5*rand(size(T*t))+0.15*square(2*pi/T*t));


    diff_theta=pinv(J_left)*[
        dp+gamma*AF_SBP((err))+lamda(t,err,T,y)+noise;
        sign(err)
        ];


    t
    err
end