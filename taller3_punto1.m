%Taller 2 
%Integrantes: Santiago Farias- Gabriela Rojas
M = 1000;
N = 1000;
r = 200;
circulo(M,r)
rectangulo(M,N)

function circulo(M,r)
xc = round(M/2);
yc = round(M/2);
a = zeros(M);
r2 = r;
while r2 > -1
     for i = 0:pi/(r^2):2*pi
         x = round(r2 * cos(i));
         y = round(r2 * sin(i));
         a(x+ xc,y+ yc)= 1;
     end
     r2 = r2-1;
end

subplot(1,2,1);
imshow(a);
title('Circulo');
end

function rectangulo(M,N)
rec = ones(M, N);
subplot(1,2,2);
imshow(rec);
title('Rectangulo');
end