% LU Factorization Algorithm (7.c)

clc
% matriks equation
A = [2 0 0 0 3;
     1 1.5 0 0 4.5;
     0 -3 0.5 0 -6.6;
     2 -2 1 1 0.8];
n = length(A)-1;

disp("Matrix equation\n")
disp(A)
disp("\n")

for i=1:n
  for j=1:n
    a(i,j) = A(i,j);
  endfor
endfor
disp("Matrix A\n")
disp(a)
disp("\n")

for i=1:n
  b(i,1) = A(i,length(A));
endfor

for i=1:n
  for j=1:n
    if i==j
      l(i,j) = 1;
      u(i,j) = 1;
    elseif
      l(i,j) = 0;
      u(i,j) = 0;
    endif
  endfor
endfor

u(1,1) = a(1,1);
if u(1,1)*l(1,1) == 0
  fprintf("Factorization impossible\n")
  return
endif

for j=2:n
  u(1,j) = a(1,j)/l(1,1);
  l(j,1) = a(j,1)/u(1,1);
endfor

for i=2:n-1
  zn = 0;
  for k=1:i-1
    zn = zn + (l(i,k)*u(k,i));
  endfor
  u(i,i) = a(i,i) - zn;
  l(i,i) = 1;
  if l(i,i)*u(i,i) == 0
    fprintf("Factorization impossible\n")
    return
  endif
  for j=i+1:n
    zna = 0;
    for k=1:i-1
      zna = zna + (l(i,k)*u(k,j));
    endfor
    u(i,j) = 1/l(i,i) * (a(i,j) - zna);
    znb = 0;
    for k=1:i-1
      znb = znb + (l(j,k)*u(k,i));
    endfor
    l(j,i) = 1/u(i,i) * (a(j,i) - znb);
  endfor
endfor

znc = 0;

for k=1:n-1
  znc = znc + (l(n,k)*u(k,n));
endfor
u(n,n) = a(n,n) - znc;
l(n,n) = 1;
disp("Matrix U\n")
disp(u)
disp("\nMatrix L\n")
disp(l)
disp("\n")
if u(n,n)*l(n,n) == 0
  fprintf("Matrix A is singular\n")
endif
y(1) = b(1,1)/l(1,1);

for i=2:n
  ax = 0;
  for j=i-1:-1:1
    ax = ax + (l(i,j)*y(j));
  endfor
  y(i) = (b(i)-ax)/l(i,i);
endfor
disp("Value of y\n")

for i=1:n
  fprintf("\ty%d = ", i)
  disp(y(i))
endfor
x(n) = y(n)/u(n,n);

for i=n-1:-1:1
  ax = 0;
  for j=i+1:n
    ax = ax + (u(i,j)*x(j));
  endfor
  x(i) = (y(i)-ax)/u(i,i);
endfor
disp("\nSolution\n")
for i=1:n
  fprintf("\tx%d = ", i)
  disp(x(i))
endfor
