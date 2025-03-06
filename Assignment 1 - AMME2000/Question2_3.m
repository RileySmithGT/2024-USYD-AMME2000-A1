% Constants and Parameters
L = 2000; % Length of the domain in meters
D = 5e-1; % Diffusivity of CO in m^2/s
dt = 60; % Time step in seconds
t_final = 95124; %30 * 60; % Final time (30 minutes converted to seconds)
Nx_values = [9, 17, 33, 65, 129]; % Different choices of spatial grid points
N_terms = 500; % Number of Fourier terms for analytical solution

hold on;

% Plot numerical solutions for different Nx values
for i = 1:length(Nx_values)
    Nx = Nx_values(i);
    dx = L / (Nx - 1);
    x_numerical = linspace(0, L, Nx);
    c_numerical = numericalSolutionFTCS(Nx, dt, dx, D, t_final);
    plot(x_numerical, c_numerical, colors(i), 'LineWidth', 1);
end

% Plot the analytical solution
x_analytical = linspace(0, L, 129);
C_analytical = analyticalSolution(x_analytical, t_final, L, D, N_terms);
plot(x_analytical, C_analytical, 'k-', 'LineWidth', 1);

% Formatting the plot
title('CO Mass Fraction in the Mine Shaft at t = 30 min');
xlabel('Distance along the shaft (m)');
ylabel('CO Mass Fraction, C');
legend('Nx = 9', 'Nx = 17', 'Nx = 33', 'Nx = 65', 'Nx = 129', 'Analytical Solution', 'Location', 'best');
hold off;
