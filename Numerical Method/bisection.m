clc
% Manuliskan fungsi terlebih dahulu
f = @(x) 3*(x + 1)*(x -1/2)*(x-1);

% Memasukan inputan pada fungsi yang akan digunakan
a = input("Masukkan interval a: ");
b = input("Masukkan interval b: ");
tol = input("Masukkan batas toleransi: ");
iterasi = input("Masukan iterasi: ");

if (f(a)<0 && f(b)<0) || (f(a)>0 && f(b)>0)
  fprintf("Bukan termasuk bisection\n")
else
  fprintf('n\t | a\t\t | b\t\t | p\t\t | f(p)\n')
  i = 1;
  while i <= iterasi
    c = (a+b)/2;
    fprintf('%d\t | %f\t | %f\t | %f\t | %f\n', i, a, b, c, f(c));
    if f(c) == 0 || abs(f(c)) < tol
      fprintf("Akar persamaannya adalah: %f", c)
      return
    elseif f(a)*f(c) < 0
      b = c;
    elseif f(b)*f(c) < 0
      a = c;
    endif
    i+=1;
  end
end