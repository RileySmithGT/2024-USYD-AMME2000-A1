function c_numerical = numericalSolutionFTCS(Nx, dt, dx, D, t_final)
    % Initialize the concentration profile
    c_numerical = zeros(Nx, 1);           % Solution vector
    c_numerical(1) = 1;                   % CO mass fraction fixed at 1.0 at x = 0
    % Coefficient for the FTCS scheme
    sigma = D * dt / dx^2;
    % Time-stepping loop
    for t = dt:dt:t_final
        % Initialize a temporary vector for the new time step
        c_new = c_numerical;
        % Loop over space
        for i = 2:Nx-1
            % FTCS scheme
            c_new(i) = sigma*c_numerical(i-1) + (1-2*sigma)*c_numerical(i) + sigma*c_numerical(i+1);
        end
        
        % Boundary conditions
        c_new(1) = 1;        % CO mass fraction fixed at 1.0 at x = 0
        c_new(end) = 0;      % CO mass fraction fixed at 0 at x = L
        
        % Update the concentration profile
        c_numerical = c_new;
    end
end
