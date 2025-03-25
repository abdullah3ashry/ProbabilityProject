% generate_X2.m
% Generates random variables from a uniform distribution X2 ~ U(-5, 2)

% Number of samples
n = 1000;

% Generate random samples from U(-5, 2)
X2 = -5 + (2 - (-5)) * rand(n, 1);  % 1000 samples from U(-5, 2)

% Display the first few samples
disp('First 5 samples of X2 (Uniform):');
disp(X2(1:5));

% Save the variable X2 to a .mat file
save('X2_uniform.mat', 'X2');  % Saves X2 to a .mat file

% Plot histogram of X2
figure;
histogram(X2, 30, 'Normalization', 'pdf', 'EdgeColor', 'b');
title('X2 ~ U(-5, 2)');
xlabel('Value');
ylabel('Probability Density');
