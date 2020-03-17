function [u_i] = RandNumGen(numArray)
    for j = numArray
        u_i(1, j) = lin_cong(j);
    end
end