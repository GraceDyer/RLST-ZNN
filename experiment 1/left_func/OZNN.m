
function dy = OZNN(t,x,AF,g,beta)
T=0.1;

% A_noise = 10;
% omega_noise = 0.5;
% phi_noise = pi/4;
% noise=A_noise * sin(2 * pi / T * t + phi_noise);


%     amplitude_square_wave = 10; 
%     frequency_square_wave = 0.3; 
%     duty_cycle_square_wave = 0.5; 
%     noise = amplitude_square_wave * square(2 * pi / T * t, duty_cycle_square_wave);


%     amplitude_triangle_wave = 10; 
%     frequency_triangle_wave = 0.3; 
%     width_triangle_wave = 0.7; 
%     noise = amplitude_triangle_wave * sawtooth(2 * pi / T * t, width_triangle_wave);



noise = 5 * sin(2 * pi * t) + 5 * square(2 * pi * t)+5 * sawtooth(2 * pi * t) + 10 * rand(size(t));



%     lower_bound = -10; 
%     upper_bound = 10; 
%     noise = lower_bound + (upper_bound - lower_bound) * rand(size(x(1)));
 

%     noise =10; 

dy = [
    -g*AF(x(1))+noise;
    0;
    0
    ];
    t
end


















