% generate_X3.m
% Generates random variables from a normal distribution X3 ~ N(3, 4)

% Number of samples
n = 1000;

% Parameters for Normal distribution
mu = 3;       % Mean
sigma = sqrt(4);  % Standard deviation (sqrt of variance)

% Generate random samples from N(3, 4)
X3 = mu + sigma * randn(n, 1);  % 1000 samples from N(3, 4)

% Display the first few samples
disp('First 5 samples of X3 (Normal):');
disp(X3(1:5));

% Save the variable X3 to a .mat file
save('X3_normal.mat', 'X3');  % Saves X3 to a .mat file

% Plot histogram of X3
figure;
histogram(X3, 30, 'Normalization', 'pdf', 'EdgeColor', 'r');
title('X3 ~ N(3, 4)');
xlabel('Value');
ylabel('Probability Density');
