f = @(x) x^2.*log(x); % fungsi yang ingin dicari hampiran integralnya
a = input("Batas Bawah: ");
b = input("Batas Atas: ");
n = input("Nilai n: ");
h = (b - a) ./ (2.^(0:n-1));

R(1, 1) = (h(1) / 2) * (f(a) + f(b));

for j = 2:n
  zn = 0;
  for i = 1:2^(j-2)
    zn = zn + f(a + (2*i-1)*h(j));
  endfor
    R(j, 1) = (1/2) * R(j-1, 1) + h(j) * zn;
  for k = 2:j
    R(j, k) = R(j, k-1) + (R(j, k-1) - R(j-1, k-1)) / ((4^(k-1))-1);
  endfor
endfor
for i=1:length(R)
  for j=1:length(R)
    fprintf("R(%d,%d) = %f\n", i, j, R(i,j))
  endfor
endfor
fprintf("\n")
disp(R)