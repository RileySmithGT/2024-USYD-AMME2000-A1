% Constants and Parameters
L = 2000; % Domain length in meters
D = 5e-1; % Diffusivity of CO in m^2/s
dt = 60; % Time step in seconds
Nx = 129; % Spatial grid points
dx = L / (Nx - 1);
t = 0; % Start time
target_x = 750; % Target position in meters
target_C = 0.02; % Target CO concentration

% Find the index for target_x
x_numerical = linspace(0, L, Nx);
target_index = round(target_x / dx) + 1;

% Simulation loop
while true
    t = t + dt; % Increment time
    c_numerical = numericalSolutionFTCS(Nx, dt, dx, D, t);
    
    if c_numerical(target_index) >= target_C
        break; % Condition met, exit loop
    end
end

fprintf('CO concentration reaches %4.3f at x = %4.2f m after %d seconds (%.2f hours).\n',target_C,target_x, t, t/3600);
