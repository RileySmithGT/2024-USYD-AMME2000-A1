function [Ynum] = test(nxarray,nt)
%% This function calculates the solution to the heat equation using the FTCS scheme.
% Inputs:   
%        - nxarray    array of numbers of divisions in the x-domain
%        - nt         number of time steps taken

% Set up initial variables here.
L = 2000;                            % Length of domain [m]
D = 0.5;                             % Diffusivity constant [m^2/s]


% No change before the loop

for nx = nxarray
    x = linspace(0, L, nx);   % Define spatial domain
    dx = x(2) - x(1);         % Calculate spatial step size
    dt = 60;                  % Time step (s)
    sigma = D*dt/dx^2;        % Stability criterion
    
    % Initialize temperature distribution
    Yn = zeros(nx, 1);        % Initial condition
    Yn(1) = 1;                % Boundary condition at x=0

    % Time-stepping loop
    for n = 1:nt
        Ynp1 = Yn;           % Copy current state to next (temporary)
        for i = 2:nx-1       % Skip the boundary points
            Ynp1(i) = Yn(i) + sigma*(Yn(i+1) - 2*Yn(i) + Yn(i-1));
        end
        Yn = Ynp1;           % Update temperature profile for next step
    end

    % Plot current nx resolution result
    plot(x, Yn, 'DisplayName', sprintf('nx = %d', nx));
    hold on;  % Ensure this is outside the loop if you want all plots together
end

% Properly format the plot outside the loop
title('Numerical approximations of CO Concentration');
xlabel('Position along the shaft (m)');
ylabel('CO Concentration');
legend('show');
end
