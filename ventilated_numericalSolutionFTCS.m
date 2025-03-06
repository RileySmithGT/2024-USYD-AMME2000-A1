function c_numerical = ventilated_numericalSolutionFTCS(Nx, dt, dx, D, t_final,x)
    % Initialize the concentration profile
    c_numerical = zeros(Nx, 1); % Solution vector
    c_numerical(1) = 1; % CO mass fraction fixed at 1.0 at x = 0

    % Coefficient for the FTCS scheme
    sigma = D * dt / dx^2;

    % Discretize the source term f(x,t) = -0.001e^(-0.01x^(1.5))
    f = -0.001 * exp(-0.01 * x.^1.5);
    
    % Time-stepping loop
    for t = dt:dt:t_final
        % Initialize a temporary vector for the new time step
        c_new = c_numerical;
        % Loop over space
        for i = 2:Nx-1
            % FTCS scheme with source term
            c_new(i) = c_numerical(i) + sigma * (c_numerical(i-1) - 2 * c_numerical(i) + c_numerical(i+1)) + dt * f(i);
        end
        
        % Boundary conditions
        c_new(1) = 1; % CO mass fraction fixed at 1.0 at x = 0
        c_new(end) = 0; % CO mass fraction fixed at 0 at x = L
        
        % Update the concentration profile
        c_numerical = c_new;
    end
end
