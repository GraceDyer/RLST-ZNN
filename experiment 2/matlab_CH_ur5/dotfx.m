
function y=dotfx(t,x)


y = ur5_jacob(x);
if rank(y)~=3
     t
     y
    y=y+10^(-5)
else
    y=y;
end
