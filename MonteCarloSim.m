W_Times = zeros([1, 1000]);     %Allocate space for W_Times to be filled
nums = 1:1:4000; 
randNums = RandNumGen(nums);    %Random numbers to chose from
secondaryNums = 1:1:4000;       %Second selection of random numbers to chose from
secondaryRandNums = RandNumGen(secondaryNums);

lambda = 0.08333;   %1/12

index1 = 1;
index2 = 1;
indexW = 1;
time = 0;
count = 0;

for l = W_Times
    while(count < 4)
        time = time + 6;
        if(randNums(1, index1) <= 0.2)
            time = time + 3;
        elseif(( 0.2 < randNums(1, index1)) && (randNums(1, index1) <= 0.5))
            time = time + 25;
        else
            time = time + RandVarGen(randNums(1, index2),lambda);
            index2 = index2 + 1;
            count = 4;
        end
        count = count + 1;
        time = time + 1;
        index1 = index1 + 1;
    end
    W_Times(1, indexW) = time;
    indexW = indexW + 1;
    count = 0;      %exited tree diagram, reset counter
    time = 0;       %reset time placeholder
end

W_Times

wLessEqual15 = 0;
wLessEqual20 = 0;
wLessEqual30 = 0;
wGreaterEqual40 = 0;

Second_quartile = median(W_Times);
First_quartile = median(W_Times())

for t = 1:1:length(W_Times)
   if(W_Times(1, t) <= 15) 
       wLessEqual15 = wLessEqual15 + 1;
   end
   if(W_Times(1, t) <= 20)
       wLessEqual20 = wLessEqual20 + 1;
   end
   if(W_Times(1, t) <= 30)
       wLessEqual30 = wLessEqual30 + 1;
   end
   if(W_Times(1, t) > 40)
       wGreaterEqual40 = wGreaterEqual40 + 1;
   end
end

wLessEqual15 = wLessEqual15 / 1000;             %Step 5 (iii) probabilities
wLessEqual20 = wLessEqual20 / 1000;
wLessEqual30 = wLessEqual30 / 1000
wGreaterEqual40 = wGreaterEqual40 / 1000

plot_W_Times = transpose(W_Times);
x = 0:1:100;                                    %Graphing CDF of Normal Distribution
pd = fitdist(plot_W_Times, 'Normal');
p = cdf(pd, x);
plot(x,p)
plot(x, pd)
normpdf(x, )

