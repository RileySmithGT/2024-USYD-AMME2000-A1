% Define the range of x values
x = 0:1:2000; % from -10 to 10 with a step of 0.1

% Define the linear function parameters
L = 2000;
m = 1/L; % slope
b = -1; % y-intercept

% Calculate y values
y = m*x + b;

% Plot the function
plot(x, y);
grid on; % Add grid lines for better readability

% Set the height of y-axis
ylim([-1.1 0]); % This sets the y-axis limits from 0 to 1

% Set the width of x-axis (if needed)
xlim([0 L]); % This sets the x-axis limits from 0 to L

% Label the axes
xlabel('Distance along the mine shaft, x (m)');
ylabel('Modified Initial CO Mass Fraction, C_H(x,0)');

% Add a title
title('Plot of the Modified Initial Condition');

saveas(gcf, 'myplot.pdf');