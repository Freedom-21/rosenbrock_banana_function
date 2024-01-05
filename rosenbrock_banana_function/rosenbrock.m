function result = rosenbrock(x)
    result = (1 - x(:, 1)).^2 + 100 * (x(:, 2) + 1.5 - (x(:, 1)).^2).^2;
end
