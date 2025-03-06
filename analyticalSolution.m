function C = analyticalSolution(x, t, L, D, N_terms)
    C = 0; % Initialize C
    SteadyState = -(x / L) + 1; % Steady-state solution, calculated once outside the loop
    for n = 1:N_terms
        C = C + (-2 / (n * pi)) * sin(n * pi * x / L) * exp(-D * (n * pi / L)^2 * t);
    end
    C = C + SteadyState; % Add Steady State to the final solution
end
