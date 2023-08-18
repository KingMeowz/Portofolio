% Algorithm Gaussian Elimination with Partial Pivoting

clc
% matriks equation
A = [0 1 1 6;
     1 -2 -1 4;
     1 -1 1 5];

n = length(A)-1;
disp(A)
disp("\n")

% Step 1
for i=1:n
  NROW(i) = i;
endfor

% Step 2
for i=1:n-1
  p = 0;
  j = i;
  % Step 3
  for z=2:n
    if abs(A(NROW(j),i)) < abs(A(NROW(z),i))
      j = z;
    endif
  endfor
  while p <= n
    if i <= p && p <= n && abs(A(NROW(p),i)) == abs(A(NROW(j),i))
      break
    elseif
      p = p+1;
    endif
  endwhile
  % Step 4
  if A(NROW(p),i) == 0
    fprintf("no unique solution exists\n")
    return
  endif
  % Step 5
  if NROW(i) != NROW(p)
    for tr=1:n+1
      zn = A(NROW(p),tr);
      A(NROW(p),tr) = A(NROW(i),tr);
      A(NROW(i),tr) = zn;
    endfor
  endif
  disp(A)
  disp("\n")
  % Step 6
  for j=i+1:n
    % Step 7
    m(NROW(j),i) = A(NROW(j),i)/A(NROW(i),i);
    for k=1:n+1
      A(NROW(j),k) = A(NROW(j),k)-(A(NROW(i),k)*m(NROW(j),i));
    endfor
  endfor
  disp(A)
  disp("\n")
endfor

% Step 9
if A(NROW(n),n) == 0
  fprintf("no unique solution exists\n")
  return
endif

% Step 10
x(n) = A(NROW(n),n+1)/A(NROW(n),n);

% Step 11
for i=n-1:-1:1
  ax = 0;
  for j=i+1:n
    ax = ax + (A(NROW(i),j)*x(j));
  endfor
  x(i) = (A(NROW(i),n+1)-ax)/A(NROW(i),i);
endfor
% Step 12 (Complete)
disp("Solution\n")
for i=1:n
  fprintf("\tx%d = ", i)
  disp(x(i))
endfor
