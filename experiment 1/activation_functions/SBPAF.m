function y = AF5(x)
a=1;
p=0.5;
y=a*(abs(x).^p+abs(x).^(1/p)).*sign(x);
end
