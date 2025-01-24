
function p = desired_path(t,m,n)

global px py pz;

r = 0.15; theta = pi/3 * t;       

p = [px * ones(size(theta));                             
     py + r * cos(theta) .* (1 + 0.5 * cos(5 * theta));  
     pz + r * sin(theta) .* (1 + 0.5 * cos(5 * theta))]; 

end

