function [l] = lin_cong(int)
    x = lin_cong_recurse(int);
    k = 2^(15);
    l = x/k;
end