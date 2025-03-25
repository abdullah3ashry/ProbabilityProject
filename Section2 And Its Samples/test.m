clc; clear; close all;

%% Parameters
f = 300e6;               % Frequency (Hz)
c = 3e8;                 % Speed of light (m/s)
lambda = c / f;          % Wavelength (m)
k = 2 * pi / lambda;     % Wavenumber (rad/m)

h_vert = lambda / 4;     % Height of vertical element (m)
L_horiz = lambda / 8;    % Length of each top-loading wire (m)
num_segments_vert = 10;  % Number of segments for vertical element
num_segments_horiz = 4;  % Number of segments for each horizontal element

%% Geometry
% Vertical segment (z-coordinates)
z_vert = linspace(0, h_vert, num_segments_vert+1);
z_mid_vert = (z_vert(1:end-1) + z_vert(2:end)) / 2;  % Midpoints

% Horizontal segments (x-coordinates)
x_horiz = linspace(-L_horiz/2, L_horiz/2, num_segments_horiz+1);
x_mid_horiz = (x_horiz(1:end-1) + x_horiz(2:end)) / 2;  % Midpoints

%% Discretization
N = num_segments_vert + 4 * num_segments_horiz;  % Total number of segments

% Segment lengths
len_vert = diff(z_vert);
len_horiz = diff(x_horiz);

%% Basis Functions and Geometry
% Combine midpoints and lengths into global arrays
x_coords = [zeros(1, num_segments_vert), repmat(x_mid_horiz, 1, 4)];
z_coords = [z_mid_vert, h_vert * ones(1, 4 * num_segments_horiz)];
len_segments = [len_vert, repmat(len_horiz, 1, 4)];

%% Green's Function Matrix (Impedance Matrix Z)
Z = zeros(N, N);
for m = 1:N
    for n = 1:N
        if m == n
            % Self-impedance (diagonal)
            Z(m, n) = (1j * k / (4 * pi)) * (log(2 * len_segments(n) / (len_segments(n) / 2)) - 1);
        else
            % Mutual impedance (off-diagonal)
            r_mn = sqrt((x_coords(m) - x_coords(n))^2 + (z_coords(m) - z_coords(n))^2);
            Z(m, n) = (1j * k / (4 * pi)) * exp(-1j * k * r_mn) / r_mn;
        end
    end
end

%% Excitation Vector (Voltage Source at Feed Point)
V = zeros(N, 1);
V(1) = 1;  % Voltage excitation at the base of the vertical element

%% Solve for Currents (I)
I = Z \ V;

%% Radiation Pattern Calculation
theta = linspace(0, pi, 180);  % Elevation angles
E_theta = zeros(size(theta));
for t = 1:length(theta)
    for n = 1:N
        r_n = z_coords(n) * cos(theta(t)) - x_coords(n) * sin(theta(t));
        E_theta(t) = E_theta(t) + I(n) * len_segments(n) * exp(-1j * k * r_n);
    end
end

%% Normalize Radiation Pattern
E_theta_norm = abs(E_theta) / max(abs(E_theta));

%% Input Impedance Calculation
Z_in = V(1) / I(1);

%% Results
fprintf('Input Impedance: %.2f + j%.2f Ohms\n', real(Z_in), imag(Z_in));

%% Plot Radiation Pattern
polarplot(theta, E_theta_norm);
title('Normalized Radiation Pattern');
