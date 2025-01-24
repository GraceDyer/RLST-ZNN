function l= lamda(t,e,T,y,beta)
    beta1=1;
    if t<T
        l=0;
    else
        l = lamda(t-T,e,T,y,beta)+beta*SBPAF(e)+beta1*y;
    end
end

