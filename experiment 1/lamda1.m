function q= lamda1(t,e,T,beta)

    if t<T
        q=0;
    else
        q = lamda1(t-T,e,T,beta)+beta*(e);
    end
end

