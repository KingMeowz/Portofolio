clc
function power_method()
  % Matriks pada soal
  A = [2 1 1;
       1 2 1;
       1 1 2];
  n = length(A);
  # Vektor
  x = [1; -1; 2];
  # Jumlah iterasi
  iter = 100;
  # Batas Toleransi
  tol = 1e-6;

  k = 1;
  for p=1:n
    if 1 <= p && p <= n && abs(x(p)) == norm(x, inf)
      break
    endif
  endfor
  x = x/x(p);
  fprintf("\t iterasi \t\t vektor eigen \t\t\t\t nilai eigen")
  fprintf("\n")

  while k <= iter
    y = A*x;
    mu = y(p);
    for p=1:n
      if 1 <= p && p <= n && abs(y(p)) == norm(y, inf)
        break
      endif
    endfor
    if y(p) == 0
      disp("vektor eigen: ")
      disp(x)
      disp("A memiliki nilai eigen 0, pilih vektor baru x dan mengulang kembali")
      return
    endif
    error = norm(x-(y/y(p)), inf);
    x = y/y(p);
    fprintf("\t%d\t\t", k)
    fprintf("(%f, %f, %f)\t\t", x(1), x(2), x(3))
    fprintf("%f", mu)
    if error < tol
      return
    endif
    fprintf("\n")
    k = k+1;
  endwhile
endfunction

function inverse_power_method()
  % Matriks
  A = [2 1 1;
       1 2 1;
       1 1 2];
  n = length(A);
  # Matriks I
  for i=1:n
    for j=1:n
      if i==j
        I(i,j) = 1;
      elseif
        I(i,j) = 0;
      endif
    endfor
  endfor
  # Vektor
  x = [1; -1; 2];
  # Iterasi
  iter = 100;
  # batas toleransi
  tol = 1e-6;
  q = (x'*A*x)/(x'*x);
  k = 1;
  for p=1:n
    if 1 <= p && p <= n && abs(x(p)) == norm(x, inf)
      break
    endif
  endfor
  x = x/x(p);
  fprintf("\t Iterasi(n) \t\t Vektor eigen \t\t\t\t Nilai eigen")
  fprintf("\n")

  while k <= iter
    y = (A - q*I) \ x;
    if rcond(A - q*I) < eps
        disp('q is an eigenvalue');
        disp(q);
        return;
    endif
    u = y(p);
    for p=1:n
      if 1 <= p && p <= n && abs(y(p)) == norm(y, inf)
        break
      endif
    endfor
    error = norm(x-(y/y(p)), inf);
    x = y/y(p);
    fprintf("\t%d\t\t", k)
    fprintf("(%f, %f, %f)\t\t", x(1), x(2), x(3))
    mu = (1/u)+q;
    fprintf("%f", mu)
    if error < tol
      return
    endif
    fprintf("\n")
    k = k + 1;
  endwhile
endfunction

fprintf("1. Algoritma 9.1 (Power Method) \n2. Algoritma 9.3 (Inverse Power Method)\n")
p = input("\nAlgoritma (1 or 2): ");
if p == 1
  power_method()
elseif p == 2
  inverse_power_method()
endif


