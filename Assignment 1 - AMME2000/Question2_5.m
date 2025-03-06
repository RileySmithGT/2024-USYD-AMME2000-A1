% Constants and Parameters
L = 2000; % Length of the domain in meters
D = 5e-1; % Diffusivity of CO in m^2/s
dt = 60; % Time step in seconds
time_hours = [1, 6, 12, 18, 24]; % Time points in hours to plot
Nx = 129; % Choice of spatial grid points as per question 2.5
dx = L / (Nx - 1);
x_numerical = linspace(0, L, Nx);

hold on;

% Loop over specified time points
for i = 1:length(time_hours)
    t_final = time_hours(i) * 3600; % Convert hours to seconds
    c_numerical = numericalSolutionFTCS(Nx, dt, dx, D, t_final);
    plot(x_numerical, c_numerical, colors(i), 'LineWidth', 1, 'DisplayName', sprintf('%d hours', time_hours(i)));
end

% Formatting the plot
title('CO Mass Fraction in the Mine Shaft at Different Times');
xlabel('Distance along the shaft (m)');
ylabel('CO Mass Fraction, C');
legend('Location', 'best');
hold off;
