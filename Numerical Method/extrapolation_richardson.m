f = @(x) x * exp(x); 

% Make input parameters 
h = input('Masukan nilai hampiran Anda : '); 
x = input('Masukan nilai x (turunan) Anda : '); 
orde = input('Masukan nilai orde yang Anda mau : '); 
eps_step = 1e-50; 

% Initialize variables 
f0 = f(x); 
fd1 = (f(x+h)-f0)/h; 
fd2 = (f(x+h)-f(x-h))/(2*h); 

% Calculate higher order approximations using Richardson extrapolation 
R = zeros(orde+1, orde+1); 
R(1, 1) = fd1; 
for i=1:100  
    h = h/2;  

    R(i + 1, 1) = (f(x + h) - f(x - h))/(2*h);  

    for j=1:i  
        R(i + 1, j + 1) = (4^j*R(i + 1, j) - R(i, j))/(4^j - 1);  
    end  

    if ( abs( R(i + 1, i + 1) - R(i, i) ) < eps_step )  
        break;  
    elseif ( i == 100 )  
        error( 'Richardson extrapolation failed to converge' );  
    end  
end 
fd = diag(R); 

% Print results 
clc 
disp("\n###############################################") 
disp("\tHasil Ekstrapolasi Richardson") 
disp("#################################################") 
for i = 1:orde+1 
    fprintf('Turunan orde ke-%d hingga hampiran h: %f\n', i-1, fd(i)); 
end 

