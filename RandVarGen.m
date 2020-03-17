function [x_i] = RandVarGen(u_i, lambda)
    x_i = -1*log(1.0 - u_i) / lambda;
end