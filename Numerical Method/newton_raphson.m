clc

function newton_raphson(f)
  z = @(x) 3*x^2 - 6*x; % Ini merupakan fungsi turunan yang akan dipakai dalam metode ini f`(x)

  p0 = input("Enter a value for p0: ");
  toleransi = input("Enter a value for tol : ");
  iterasi = input("Enter a value for iteration : ");

  i = 1;
  while i <= iterasi
    p = p0 - f(p0) / z(p0);
    fprintf("%d. p0 = %f, f(a) = %f, f'(a) = %f, p = %f, |p-p0| = %f\n", i, p0, f(p0), z(p0), p, abs(p-p0))
    if abs(p - p0) < toleransi
      break;
    endif
    p0 = p;
    i = i + 1;
  end
  fprintf("Akar = %f\n", p)
  fprintf("Iterasi = %d\n", i)
endfunction

function secant(f)
  p0 = input("Enter a value for p0: ");
  p1 = input("Enter a value for p1: ");
  toleransi = input("Enter a value for tol : ");
  iterasi = input("Enter a value for iteration : ");
  q0 = f(p0);
  q1 = f(p1);
  i = 1;
  while i <= iterasi
    p = p1 - q1 * (p1 - p0) / (q1 - q0);
    fprintf("%d. p0 = %f, p1 = %f, q0 = %f, q1 = %f, p = %f, |p-p1| = %f\n", i, p0, p1, q0, q1, p, abs(p-p1))
    if abs(p - p1) < toleransi
      break;
    endif
    p0 = p1;
    q0 = q1;
    p1 = p;
    q1 = f(p);
    i = i + 1;
  endwhile
  fprintf("Akar = %f\n", p)
  fprintf("Iterasi = %d\n", i)
endfunction

function regula_falsi(f)
  p0 = input("Enter a value for p0: ");
  p1 = input("Enter a value for p1: ");
  toleransi = input("Enter a value for tol : ");
  iterasi = input("Enter a value for iteration : ");
  q0 = f(p0);
  q1 = f(p1);
   i = 1;
  while i <= iterasi
    p = p1 - q1 * (p1 - p0) / (q1 - q0);
    fprintf("%d. p0 = %f, p1 = %f, q0 = %f, q1 = %f, p = %f, |p-p1| = %f\n", i, p0, p1, q0, q1, p, abs(p-p1))
    if abs(p - p1) < toleransi
      break;
    endif
    q = f(p);
    if q * q1 < 0
      p0 = p1;
      q0 = q1;
    endif
    p1 = p;
    q1 = q;
    i = i + 1;
  endwhile
  fprintf("Akar = %f\n", p)
  fprintf("Iterasi = %d\n", i)
endfunction

% Fungsi 2
f = @(x) x^3 + 3*x^2 - 1;


while true
  fprintf("=============================================================================================================\n")
  fprintf("\t\tProgram mencari nilai akar dengan Metode Secant, False Position, Newton-Raphson\n")
  fprintf("=============================================================================================================\n")
  fprintf("Fungsinya adalah : x^3+ 3*x^2 - 1 = 0\n")
  fprintf("Kode masukan metode pemrosesan (secant => s), (false position => f) (Newton-Raphson => n) (Exit Program => q)\n")
  choose = input("Masukan metode yang akan Anda pakai : ", "s");
  fprintf("\n")
  if choose == "s" || choose == "S"
    secant(f)
  elseif choose == "f" || choose == "F"
    regula_falsi(f)
  elseif choose == "n" || choose == "N"
    newton_raphson(f)
  elseif choose == "q" || choose == "Q"
    break;
  else
    fprintf("Pilihan Tidak Ditemukan, Silahkan Coba Kembali!\n")
  end
  fprintf("\n")
endwhile