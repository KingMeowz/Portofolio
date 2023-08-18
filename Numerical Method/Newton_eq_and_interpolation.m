% Input the table data
x = [-0.1; 0; 0.2; 0.3];
f = [5.3; 2; 3.19; 1];
n = length(x);

% Apply Newton's Divided-Difference Formula
for i = 2:n
     for j = n:-1:i
          f(j) = (f(j) - f(j-1)) / (x(j) - x(j-i+1));
     end
end

% Construct the polynomial using the divided differences
p = @(t) f(n);

for i = n-1:-1:1
     p = @(t) f(i) + (t - x(i)) .* p(t);
end


% Solution of polynomial newton's division 
disp("\n\tP3(x) = a0 + a1(x-x0) + a2(x-x0)(x-x1) + a3(x-x0)(x-x1)(x-x2)")
disp("\tP3(x) = 5.3 + (-33)(x-(-0.1)) + 129.83(x-(-0.1))(x-0.0) + (-556.67)(x-(-0.1))(x-0)(x-0.2)")
disp("\tP3(x) = 5.3 - 33(x+0.1) + 129.83(x+0.1)(x) - 556.65(x+0.1)(x)(x-0.2)")

% Plot the interpolating polynomial
xx = linspace(x(1), x(n), 1000);
yy = p(xx);
plot(xx, yy, 'b-', x, f, 'ro');
legend('Interpolating Polynomial', 'Data Points');
xlabel('x');
ylabel('f(x)');
title('Interpolation using Newton''s Divided-Difference Formula');