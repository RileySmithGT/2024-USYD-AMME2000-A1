% Constants and Parameters
L = 2000; % Length of the domain in meters
D = 5e-1; % Diffusivity of CO in m^2/s
dt = 60; % Time step in seconds
t_final = 5 * 60 * 60; % Final time (5 hours converted to seconds)
Nx_values = [9, 17, 33, 65]; % Different choices of spatial grid points, excluding 129
N_terms = 500; % Number of Fourier terms 


% Main loop for error norms
for i = 1:length(Nx_values)
    Nx = Nx_values(i);
    dx = L / (Nx - 1);
    x_numerical = linspace(0, L, Nx);
    c_numerical = numericalSolutionFTCS(Nx, dt, dx, D, t_final);
    % Calculate analytical solution for each point in x_numerical at t_final
    C_analytical = zeros(Nx, 1); % Initialize
    for j = 1:Nx
        C_analytical(j) = analyticalSolution(x_numerical(j), t_final, L, D, N_terms);
    end

    % Calculate error norms using the provided definition and MATLAB's norm function
    error_norms_L1(i) = norm(c_numerical(:) - C_analytical(:), 1) * dx;
    error_norms_L2(i) = norm(c_numerical(:) - C_analytical(:), 2) * sqrt(dx);
    error_norms_LInf(i) = norm(c_numerical(:) - C_analytical(:), Inf);
end

% Compute orders of accuracy, starting from the second entry
for i = 2:length(Nx_values)
    dx_i = L / (Nx_values(i-1) - 1);
    dx_ip1 = L / (Nx_values(i) - 1);
    
    orders_L1(i-1) = log(error_norms_L1(i-1) / error_norms_L1(i)) / log(dx_i / dx_ip1);
    orders_L2(i-1) = log(error_norms_L2(i-1) / error_norms_L2(i)) / log(dx_i / dx_ip1);
    orders_LInf(i-1) = log(error_norms_LInf(i-1) / error_norms_LInf(i)) / log(dx_i / dx_ip1);
end

% Display the results, including the calculated orders of accuracy
disp('Nx     L1 Norm         L2 Norm         L∞ Norm        Order L1     Order L2     Order L∞');
for i = 1:length(Nx_values)
    if i == 1
        % No order of accuracy for the first entry
        fprintf('%-7d %-15.5e %-15.5e %-15.5e\n', ...
            Nx_values(i), error_norms_L1(i), error_norms_L2(i), error_norms_LInf(i));
    else
        % Display the calculated orders of accuracy for Nx_values except for 129
        fprintf('%-7d %-15.5e %-15.5e %-15.5e %-12.5f %-12.5f %-12.5f\n', ...
            Nx_values(i), error_norms_L1(i), error_norms_L2(i), error_norms_LInf(i), ...
            orders_L1(i-1), orders_L2(i-1), orders_LInf(i-1));
    end
end
