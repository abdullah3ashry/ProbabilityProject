% Set the number of samples
    numSamples = 1000000;

    % b) X2 and Y2
    X2 = normrnd(3, sqrt(4), [1, numSamples]); % N(3, 4)
    Y2 = normrnd(-5, sqrt(2), [1, numSamples]); % N(-5, 2)
    data_b = [X2; Y2]; % Combine into 2 x n matrix
    save('data_X2_y2.mat', 'data_b');

    % c) X3 and Y3
    X3 = gamrnd(2, 10, [1, numSamples]); % Gamma(2, 10)
    Y3 = binornd(4, 0.5, [1, numSamples]); % Bin(4, 0.5)
    data_c = [X3; Y3]; % Combine into 2 x n matrix
    save('data_X3_y3.mat', 'data_c');

    % d) X4 and Y4
    X4 = exprnd(1 / 0.05, [1, numSamples]); % Exp(0.05) -> Mean = 1/rate
    Y4 = 3 * X4 + 2; % Y4 = 3*X4 + 2
    data_d = [X4; Y4]; % Combine into 2 x n matrix
    save('data_X4_y4.mat', 'data_d');

    % e) X5 and Y5
    X5 = randsrc(1, numSamples, [-1, 1]); % Uniformly distributed {−1, 1}
    noise = normrnd(0, sqrt(0.5), [1, numSamples]); % N(0, 0.5)
    Y5 = X5 + noise; % Y5 = X5 + noise
    data_e = [X5; Y5]; % Combine into 2 x n matrix
    save('data_X5_y5.mat', 'data_e');