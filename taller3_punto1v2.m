%Taller 3,Punto1 
%Integrantes: Santiago Farias- Gabriela Rojas
I = imread('img1.png');
IG = rgb2gray(I);





n=2;
sigma=7;


resto=mod(n,2);%Matriz par o impar
    if resto==0
        comp=1;%par
    else
        comp=0;%impar
    end

    %Uso de filas de ceros de acuerdo a la matriz
    if comp==1
        pad=round(n/2);
    elseif comp==0
        pad=round(n/2)-1;
    end
    
    %Agregar filas y columnas de ceros.
    IGm=padarray(IG,[pad pad],0,'both');
    
    %'both','symmetric'
  
    
    %mascara media
    mascara = ones(n);%mascara a operar 
    smasc=sum(mascara,'all');%sumatoria elementos de la matriz
    kernel=mascara/smasc;%Hallar matriz promedio


    %calcular mascara gauss
    x=-pad:pad;
    y=-pad:pad;
    K=1;
    [s,t]=ndgrid(x,y);
    gauss = K*exp(- (s.^2+t.^2) / (2*sigma^2));%ecuacion caracteristica
    sumgauss=sum(gauss,'all');
    kernelgauss=gauss/sumgauss;
    
    %Sobel
    sobel1=[-1 -2 -1;0 0 0;1 2 1];
    sobel2=[-1 0 -1;-2 0 2;-1 0 1];
    
    %Prewitt
     prewit1=[-1 -2 -1;0 0 0;1 2 1];
    prewit2=[-1 0 -1;-2 0 2;-1 0 1];
    
    
    %Roberts
    
    rob1=[-1 0;0 1];
    rob2=[0 -1;1 0];

global imagen;
filtrando(IGm,rob1,pad,comp);
sobelx=imagen;
filtrando(IGm,rob2,pad,comp);
sobely=imagen;

sobelxy=(sobelx+sobely);
%pintar imagenes
    subplot(2,2,1)
    imshow(IG);
    subplot(2,2,2)
    imshow(sobelx);
    subplot(2,2,3)
    imshow(sobely);
    subplot(2,2,4)
    imshow(sobelxy);
    
function filtrando(IGm,mascara,pad,comp)
    

    CopIGm=double(IGm);%copia imagen
    [fila,colum]=size(IGm);%tamaño de la imagen
    IGmF=IGm*0;%Matriz final en 0

       %For para recorrer filas y columnas
        for i=pad+1:1:fila-pad
            for j= pad+1:1:colum-pad

                     %elegir ventana matriz de acuerdo si es par o impar   
                    if comp==1%par
                        ventana=CopIGm(i-(pad-1):i+pad, j-(pad-1):j+pad);
                    elseif comp==0%impar
                        ventana=CopIGm(i-pad:i+pad, j-pad:j+pad);
                    end

            prod=ventana .* mascara;%Producto punto de la ventana con la mascara
            sprod=sum(prod,'all');%Sumatoria elementos matriz producto
            IGmF(i,j)=sprod; %Nuevo valor del pixel

            end
        end

 %eliminar filas y columnas de 0
 filainf = fila-pad-(pad-1);
 columfin = colum-pad-(pad-1);

 IGmF(1:pad,:)=[];%eliminar filas superiores 
 IGmF(filainf:filainf+(pad-1),:)=[];%eliminar filas inferiores
  
 IGmF(:,1:pad)=[];%eliminar columnas de la izquierda 
 IGmF(:,columfin:columfin+(pad-1))=[];%eliminar columnas de la derecha 
 
 global imagen
 imagen=IGmF;
 

 
end


 



    





















% % IG2=IGm(1:3,1:3);
% % IG2=double(IG2);
% % IG3= IG2.* mascara;
% % C=sum(IG3,'all');

% IG4(1,1)=C;
% 
% [z,y] = find(IGm==53);
% 
% filtro = arrayfun(@(x,y)calfiltro(x,y), IGm);
% 
% function v=calfiltro(x,y)
% 
% % 
% % v=x+150;
% 
% % z=unit8(b);
% % if x ~= 0
% % 
% % [fila,colum] = find(x);
% % 
% %   m(1,1)= x(fila-1+z,colum-1+z);
% %   m(1,2)= x(fila-1+z,colum+z);
% %   m(1,3)= x(fila-1+z,colum+1+z);
% %   
% %   m(2,1)= x(fila+z,colum-1+z);
% %   m(2,2)= x(fila+z,colum+z);
% %   m(2,3)= x(fila+z,colum+1+z);
% %   
% %   m(3,1)= x(fila+1+z,colum-1+z);
% %   m(3,2)= x(fila+1+z,colum+z);
% %   m(3,3)= x(fila+1+z,colum+1+z);
% %   
% %   multi=m.*mascara;
% %   
% %   suma=sum(multi,'all');
% %  
% %   v=suma;
% % else
% %     v=x;
% % end
% 
% % if IGr ~= 0
% %   [z,y] = find(IGr);
% %   M(1,1)=x(z+1,y+1);
% % end
% 
% end

