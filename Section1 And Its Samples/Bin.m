% generate_X4.m
% Generates random variables from a binomial distribution X4 ~ Bin(5, 0.3)

% Number of samples
n = 1000;

% Parameters for Binomial distribution
trials = 5;  % Number of trials
p = 0.3;     % Probability of success

% Generate random samples from Bin(5, 0.3)
X4 = binornd(trials, p, n, 1);  % 1000 samples from Bin(5, 0.3)

% Display the first few samples
disp('First 5 samples of X4 (Binomial):');
disp(X4(1:5));

% Plot histogram of X4
figure;
histogram(X4, 'Normalization', 'pdf', 'EdgeColor', 'g');
title('X4 ~ Bin(5, 0.3)');
xlabel('Number of Successes');
ylabel('Probability');
