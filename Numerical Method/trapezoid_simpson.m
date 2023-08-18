% Contoh penggunaan
f = @(x) x.*log(x); % fungsi yang ingin dicari hampiran integralnya
a = input("Batas Bawah: ");
b = input("Batas Atas: ");
n = input("Nilai n: ");

function approx_integral(f, a, b, n)
  h = (b-a)/n;
  XI_trapz = 0;
  XI_simpson = 0;
   % Metode Trapezoid
  for i=1:n+1
    if i==1
      x(i) = a;
    elseif i== n+1
      x(i) = b;
    else
      x(i) = a + (i-1)*h;
    endif
  endfor
  for i=1:length(x)
    if i == length(x)
      break
    endif
    XI_trapz = XI_trapz + (h*((f(x(i))+f(x(i+1)))/2));
  endfor
   % Metode Simpson 1/3
  XI0 = f(a) + f(b);
  XI1 = 0;
  XI2 = 0;
  for i=1:n-1
     X = a + i * h;
     if (mod(i, 2) == 0)
       XI2 = XI2 + f(X);
     else
       XI1 = XI1 + f(X);
     endif
  endfor
  XI_simpson = h * (XI0 + 2 * XI2 + 4 * XI1) / 3;
   fprintf("Metode Trapezoid (n = %d) = %f\n", n, XI_trapz);
  fprintf("Metode Simpson 1/3 (n = %d) = %f\n", n, XI_simpson);
  fprintf("Nilai Eksak = %f\n", integral(f, a, b));
endfunction

approx_integral(f, a, b, n);