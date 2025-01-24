
function y = AF_SBP(E,p)
if nargin==1, p=0.5;
end
i=find(E>0);
y(i)=0.5*abs(E(i)).^p+0.5*abs(E(i)).^(1/p);

j=find(E<=0);
y(j)=-0.5*abs(E(j)).^p-0.5*abs(E(j)).^(1/p);
y=y';
end

