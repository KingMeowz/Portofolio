clc
% matriks equation
A = [0 1 -2 4;
     1 -1 1 6;
     1 0 -1 2];

n = length(A)-1;
disp(A)
disp("\n")

for i=1:n-1
  p = 0;
  while p <= n
    if i <= p && p <= n && A(p,i) != 0
      break
    elseif
      p = p+1;
    endif
  endwhile
  if i > p || p > n || A(p,i) == 0
    fprintf("Tidak ada solusi\n")
    return
  endif
  if p != i
    for tr=1:n+1
      zn = A(p,tr);
      A(p,tr) = A(i,tr);
      A(i,tr) = zn;
    endfor
  endif
  for j=i+1:n
    m(j,i) = A(j,i)/A(i,i);
    for k=1:n+1
      A(j,k) = A(j,k)-(A(i,k)*m(j,i));
    endfor
  endfor
  disp(A)
  disp("\n")
endfor

if A(n,n) == 0
  fprintf("Tidak ada solusi\n")
  return
endif

x(n) = A(n,n+1)/A(n,n);
for i=n-1:-1:1
  ax = 0;
  for j=i+1:n
    ax = ax + (A(i,j)*x(j));
  endfor
  x(i) = (A(i,n+1)-ax)/A(i,i);
endfor

disp("Solusinya : \n")
for i=1:n
  fprintf("\tx%d = ", i)
  disp(x(i))
endfor




%% Next Chunk

clc
% matriks equation
A = [1 1 0 1 2;
     2 1 -1 1 1;
     -1 2 3 -1 4;
     3 -1 -1 2 -3];

n = length(A)-1;
disp(A)
disp("\n")

for i=1:n-1
  p = 0;
  while p <= n
    if i <= p && p <= n && A(p,i) != 0
      break
    elseif
      p = p+1;
    endif
  endwhile
  if i > p || p > n || A(p,i) == 0
    fprintf("no unique solution exists\n")
    return
  endif
  if p != i
    for tr=1:n+1
      zn = A(p,tr);
      A(p,tr) = A(i,tr);
      A(i,tr) = zn;
    endfor
  endif
  for j=i+1:n
    m(j,i) = A(j,i)/A(i,i);
    for k=1:n+1
      A(j,k) = A(j,k)-(A(i,k)*m(j,i));
    endfor
  endfor
  disp(A)
  disp("\n")
endfor

if A(n,n) == 0
  fprintf("no unique solution exists\n")
  return
endif

x(n) = A(n,n+1)/A(n,n);
for i=n-1:-1:1
  ax = 0;
  for j=i+1:n
    ax = ax + (A(i,j)*x(j));
  endfor
  x(i) = (A(i,n+1)-ax)/A(i,i);
endfor

disp("Solution\n")
for i=1:n
  fprintf("\tx%d = ", i)
  disp(x(i))
endfor
