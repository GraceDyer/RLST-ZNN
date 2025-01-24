function l= lamda(t,e,T,y)
    beta1=3;
    beta2=0.00001;
    if t<T
        l=0;
    else
        l = lamda(t-T,e,T,y)+beta1*AF_SBP((e))+beta2*y;
    end
end

