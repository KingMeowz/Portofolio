clc

x = [8.1 8.3 8.6 8.7];
y = [16.94410 17.56492 18.50515 18.82091];

xx = 8.4;
n = length(x);
yy = 0;
for i = 1:n
    L = 1;
    for j = 1:n
        if j ~= i
            L = L .* (xx - x(j)) / (x(i) - x(j));
        end
    end
    yy = yy + y(i) * L;
end

for i=1:n
  fprintf("\tx%d = ", i-1)
  fprintf("%f", x(i))
  fprintf("\tf(%f) = ", x(i))
  fprintf("%f\n", y(i))
endfor

fprintf('\n\tApproximate f(8,4) = %f\n', yy);