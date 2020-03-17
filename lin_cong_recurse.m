function [l] = lin_cong_recurse(int)
    if(int == 0)
        l = 1000;
    end
    if(int ~= 0)
        l =  mod( (24693 * lin_cong_recurse(int - 1) + 3517) , (2^(15)) ); 
    end
end