clc, clear
C_Times = zeros([1, 1000]); %Allocate space for C_Times to be filled
nums = 1:1:4000; 
randNums = RandNumGen(nums); %Primary array of random numbers to chose from
secondaryNums = 1:1:4000;       
secondaryRandNums = RandNumGen(secondaryNums); %Second selection of random numbers to chose from (Second array of random numbers used to prevent bias of number generated when choosing tree daigram path) )

lambda = 1/12; %lambda is 1 / Expected value(Mean) of an exponential distribution

index1 = 1; %indexes for accessing random numbers and spot in final calling times array
index2 = 1;
indexW = 1;
time = 0; %temporary variable for of time spent in a particular calling procees
count = 0; %Variable to prevent looping through tree diagram more than 4 times

for l = C_Times %Structure that determines the behavior of the tree diagram
    while(count < 4)
        time = time + 6;
        if(randNums(1, index1) <= 0.2) % 20% of the time callee is busy
            time = time + 3; %add specified time and continue the loop
        elseif(( 0.2 < randNums(1, index1)) && (randNums(1, index1) <= 0.5)) % 30% of the time callee is unavailable
            time = time + 25;
        else % 50% of the time callee is available to answer the phone
            if(RandVarGen(randNums(1, index2),lambda) > 25)
               time = time + 25;
               count = count + 1;
            else
                time = time + RandVarGen(randNums(1, index2),lambda); %time for callee to pick up determined by random variable generator
                count = 4; %stop the tree from looping after the successful call has been made
            end
            index2 = index2 + 1; % increment the index of the second random number
        end
        count = count + 1; %increment the loop count because the tree diagram ends after four unsuccessful unavailable calls
        time = time + 1; %add a second of time each time for hanging up
        index1 = index1 + 1; %increment the index of the primary random number
    end
    C_Times(1, indexW) = time; %add the time spent on the particular calling process to the array of all the calling times
    indexW = indexW + 1; %update the index of the calling times array
    count = 0;      %exited tree diagram, reset counter
    time = 0;       %reset time placeholder
end

C_Times;

Mean = mean(C_Times) %Mean time in calling proceess
Maximum = max(C_Times)%Longest time spent in calling process
Minimum = min(C_Times) %shortest time spent in calling procees
Second_quartile = median(C_Times) %Median time in calling process
First_quartile = median(C_Times(C_Times < Second_quartile)) %First quartile
Third_quartile = median(C_Times(C_Times > Second_quartile)) %Second quartile

wLessEqual15 = 0; %Variables to hold values for probabilities in step 5
wLessEqual20 = 0;
wLessEqual30 = 0;
wGreaterEqual40 = 0;
wGreaterW5 = 0;
wGreaterW6 = 0;
wGreaterW7 = 0;
wGreaterW8 = 0;

for t = 1:1:length(C_Times) %Loops through all times to find times (W <= w, W > w, etc.)
   if(C_Times(1, t) <= 15) 
       wLessEqual15 = wLessEqual15 + 1;
   end
   if(C_Times(1, t) <= 20)
       wLessEqual20 = wLessEqual20 + 1;
   end
   if(C_Times(1, t) <= 30)
       wLessEqual30 = wLessEqual30 + 1;
   end
   if(C_Times(1, t) > 40)
       wGreaterEqual40 = wGreaterEqual40 + 1;
   end
   if(C_Times(1, t) > 50)
       wGreaterW5 = wGreaterW5 + 1;
   end
   if(C_Times(1, t) > 80)
       wGreaterW6 = wGreaterW6 + 1;
   end
   if(C_Times(1, t) > 100)
       wGreaterW7 = wGreaterW7 + 1;
   end
   if(C_Times(1, t) > Maximum)
       wGreaterW8 = wGreaterW8 + 1;
   end
end

wLessEqual15 = wLessEqual15 / 1000; %Step 5 (iii) calculating probabilities 
wLessEqual20 = wLessEqual20 / 1000;
wLessEqual30 = wLessEqual30 / 1000;
wGreaterEqual40 = wGreaterEqual40 / 1000;
wGreaterW5 = wGreaterW5 / 1000;
wGreaterW6 = wGreaterW6 / 1000;
wGreaterW7 = wGreaterW7 / 1000;
wGreaterW8 = wGreaterW8 / 1000;

x = [0, 15, 20, 30, 40, 50, 80, 100, Maximum]; %Plotting probabilities calculated in step 5
y = [0, wLessEqual15, wLessEqual20, wLessEqual30 (1-wGreaterEqual40) (1-wGreaterW5) (1-wGreaterW6) (1-wGreaterW7) (1-wGreaterW8)];
plot(x,y);
xlabel('Time spent in calling procees, w (seconds)')
ylabel('Probability (W \leq w)')
title('CDF from Monte Carlo Simulation of Variable W')