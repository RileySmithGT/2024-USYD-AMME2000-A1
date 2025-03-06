% Parameters
Nx = 129; % Number of spatial grid points
L = 2000; % Length of the mineshaft in meters
dx = L / (Nx - 1); % Spatial step size
D = 5e-1; % Diffusivity of CO in m^2/s
dt = 60; % Time step in seconds
t_final = 26.5 * 3600; % Final time in seconds (26.5 hours converted to seconds)

% Generate the spatial grid
x = linspace(0, L, Nx);

% Call the function without source term for comparison
c_numerical = numericalSolutionFTCS(Nx, dt, dx, D, t_final);

% Call the function with source term
c_numerical_ventilated = ventilated_numericalSolutionFTCS(Nx, dt, dx, D, t_final,x);


% Plotting
figure;
plot(x, c_numerical, 'LineWidth', 2, 'DisplayName', 'Unventilated Mineshaft');
hold on;
plot(x, c_numerical_ventilated, 'LineWidth', 2, 'DisplayName', 'Ventialted Mineshaft');
hold off;

xlabel('Position along the mineshaft (m)');
ylabel('CO Mass Fraction');
title('CO Concentration Profile in the Mineshaft at T = 26.5 hours');
legend('show');
grid on;
