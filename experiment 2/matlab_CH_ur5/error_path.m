
function err = error_path(t,theta,d,a,alpha)
    p = myfkine(theta,d,a,alpha);
    err = desired_path(t)-p;
end

