
function diff_p = diff_path(t)

r = 0.15; theta = pi/3 * t;      
phi = pi/3;                       

p_common = 1 + 0.5 * cos(5 * theta);              
p_common_diff = -0.5 * 5 * sin(5 * theta) * phi;


diff_px = zeros(size(theta));                                                 
diff_py = -r * sin(theta) * phi .* p_common + r * cos(theta) .* p_common_diff; 
diff_pz =  r * cos(theta) * phi .* p_common + r * sin(theta) .* p_common_diff; 

diff_p = [diff_px; diff_py; diff_pz];

end

