%  clear;
 tspan = [0 5];
 T=0.1;
%  options=odeset('MStateDep','none','RelTol',1e-5,'AbsTol',1e-5);

x0=[5;0;0];
beta=10;



   activation_folder = 'activation_functions';

   activation_files = dir(fullfile(activation_folder, '*.m'));
figure(1);

color1 = [0, 0.45, 0.74]; 
color2 = [0.85, 0.33, 0.10]; 
color3 = [0.47, 0.67, 0.19]; 
color4 = [0.49, 0.18, 0.56]; 
color5 = [0.30, 0.75, 0.93]; 
% color6 = [0.64, 0.08, 0.18]; 

linestyle1 = '-';
linestyle2 = '-.';
linestyle3 = '--';
linestyle4 = ':';
linestyle5 = '-.'; 
% linestyle6 = '-..-';

gamma=1;
for i = 1:length(activation_files)
  
    activation_file_path = fullfile(activation_folder, activation_files(i).name);

  
    [~, activation_name, ~] = fileparts(activation_files(i).name);

   
    activation_function = str2func(activation_name);

%       figure('Position', [100, 100, 800, 350]); 
          [t,x] = ode45(@(t, x) RLSTZNN(t, x, activation_function,gamma,beta), tspan,x0,options);
          plot_fig(t,x,"RLSTZNN",color1,linestyle1);
               [t,x] = ode45(@(t, x) IZNN(t, x, activation_function,gamma,beta), tspan,x0,options);
             plot_fig(t,x,"IZNN",color2,linestyle2);
            [t,x] = ode45(@(t, x) DIZNN(t, x, activation_function,gamma,beta), tspan,x0,options);
             plot_fig(t,x,"DIZNN",color3,linestyle3);
            [t,x] = ode45(@(t, x) STZNN(t, x, activation_function,gamma,beta), tspan,x0,options);
             plot_fig(t,x,"STZNN",color4,linestyle4);
                    [t,x] = ode45(@(t, x) OZNN(t, x, activation_function,gamma,beta), tspan,x0,options);
           plot_fig(t,x,"OZNN",color5,linestyle5);
%          [t,x] = ode45(@(t, x) CRLN(t, x, activation_function,gamma,beta), tspan,x0,options);
%          plot_fig(t,x,"CRLN",color6,linestyle6);
%           ylim([0, 5]);

      legend('show');
%           set(gca, 'YScale', 'log');
    break;
end


% savefig('results/Diff_AF.fig');
% close(gcf);
function plot_fig(t,x,AF,color,linestyle)
    total=length(t);
    nerr_NFT=[];
    for j=1:total
        nerr_NFT(j)=norm(x(j)');
    end
    

    plot(t,nerr_NFT,'DisplayName', AF,'Color',color,'LineStyle',linestyle); hold on;
end
