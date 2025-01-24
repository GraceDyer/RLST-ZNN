function dy = dpsz_hs(t, y,err, T, beta_1, beta_2)

    [m,n]=size(err);
    dy = zeros(m*2, 1);  


    if (t - T) < 0
        dy(1) = 0;  
        dy(2) = 0;
    else

        err = y(1); 
        q = y(4);    
        dy(1) = beta_1 * AF_CHZNN(err) - beta_2 * q;  
        dy(2) = sign(err);  

        dy(3) = 0; 
        dy(4) = 0; 

        if (t - T) > 0
            dy = dy + dpsz_hs(t - T, y, T, beta_1, beta_2);  
        end
    end
end
