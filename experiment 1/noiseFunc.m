
t = 0:0.01:5;


sine_wave_noise = 10 * sin(2 * pi * t);


square_noise = 10 * square(2 * pi * t);


sawtooth_noise = 10 * sawtooth(2 * pi * t);


constant_noise = ones(size(t)) * 10;


random_noise = 10 * (2 * rand(size(t)) - 1);


composite_noise = 5 * sin(2 * pi * t) + 5 * square(2 * pi * t)+5 * sawtooth(2 * pi * t) + 10 * rand(size(t));


colors = {[0 0.4470 0.7410], [0.8500 0.3250 0.0980], [0.9290 0.6940 0.1250], [0.4940 0.1840 0.5560], [0.4660 0.6740 0.1880], [0.3010 0.7450 0.9330]};


% figure('Position', [100, 100, 800, 350]); 
% plot(t, sine_wave_noise, 'Color', colors{1});
% xlabel('Time');
% ylim([-20, 20]);

% figure('Position', [100, 100, 800, 350]);
% plot(t, square_noise, 'Color', colors{2});
% xlabel('Time');
% ylim([-20, 20]);

% figure('Position', [100, 100, 800, 350]);
% plot(t, sawtooth_noise, 'Color', colors{3});
% xlabel('Time');
% ylim([-20, 20]);

% figure('Position', [100, 100, 800, 350]);
% plot(t, constant_noise, 'Color', colors{4});
% xlabel('Time');
% ylim([-20, 20]);

% figure('Position', [100, 100, 800, 350]);
% plot(t, random_noise, 'Color', colors{5});
% xlabel('Time');
% ylim([-20, 20]);

% figure('Position', [100, 100, 800, 350]);
% plot(t, composite_noise, 'Color', colors{6});
% xlabel('Time');
% ylim([-20, 20]);
