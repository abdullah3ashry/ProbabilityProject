% generate_X5.m
% Generates random variables from a Poisson distribution X5 ~ Poisson(10)

% Number of samples
n = 1000;

% Parameter for Poisson distribution
lambda = 10;  % Rate parameter

% Generate random samples from Poisson(10)
X5 = poissrnd(lambda, n, 1);  % 1000 samples from Poisson(10)

% Display the first few samples
disp('First 5 samples of X5 (Poisson):');
disp(X5(1:5));

% Save the variable X5 to a .mat file
save('X5_poisson.mat', 'X5');  % Saves X5 to a .mat file

% Plot histogram of X5
figure;
histogram(X5, 'Normalization', 'pdf', 'EdgeColor', 'm');
title('X5 ~ Poisson(10)');
xlabel('Value');
ylabel('Probability');
