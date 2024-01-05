function accurancy_result = accurancy(X, name)
x = 1;
y = -0.5;
accurancy_result = sqrt((x-X(1))^2 + (y - X(2))^2);
fprintf('accurancy of %s: %e\n', name, accurancy_result);
end
