# ProbabilityProject1

This repo contains the Matlab code used for a MINI-PROJECT 1 from APMA 3100 (Spring 2020). The prompt for the project is as follows:

> *A representative of a high-speed Internet provider calls customers to assess their
satisfaction with the service. It takes her 6 seconds to turn on a phone and dial a number; then 3
additional seconds to detect a busy signal, or 25 additional seconds to wait for 5 rings and
conclude that no one will answer; and 1 second to end a call. After an unsuccessful call, she redials (in the course of several days) until the customer answers or she has dialed four times. The
outcome of each dialing is determined in an identical way: the customer being called is using the
line with probability 0. 2; or is unavailable to answer the call with probability 0.3; or is available
and can answer the call within X seconds, which is a continuous random variable with the mean
of 12 seconds and the exponential distribution. The calling process ends when the customer
answers the call, or when four unsuccessful calls have been completed.*

**MonteCarloSim.m** Performs a Monte Carlo Simulation for the prompt. Simulates the process 1000 times and finds the mean,the first quartile, the median, the third quartile, and the probability of the following events for the generated sample *W*. *W* denotes the total time spent by the representative on calling one customer. :

* W ≤ 15
* W ≤ 20
* W ≤ 30
* W > 40
* W > w<sub>5</sub>
* W > w<sub>6</sub>
* W > w<sub>7</sub>

w<sub>5</sub>, w<sub>6</sub>, w<sub>7</sub> are the values chosen in order to depict the right tail of the
cumulative distribution function of *W*. *MonteCarloSim.m* generates random numbers and variables using *RandNumGen.m* and *RandVarGen.m*.

**RandNumGen.m :** Generates random numbers using a linear congruential random number generator.

**RandVarGen.m :** Generates random variables using the random numbers from *RandNumGen.m*.

**lin_cong.m :** Calculates the linear congruential random number generator formula for *RandNumGen.m*.

**lin_cong_recurse.m :** Calculates recursive sub-problems in the linear congruential random number generator formula for *lin_cong.m*.
