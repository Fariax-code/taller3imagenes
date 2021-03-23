%Taller 3,Punto1 
%Integrantes: Santiago Farias- Gabriela Rojas
I = imread('ruidosalp.jpg');
IG = rgb2gray(I);



 n=5;
 pad=round(n/2)-1;
 
  %Agregar filas y columnas de ceros.
   IGm=padarray(IG,[pad pad],0,'both');
    filtromedia(IGm,pad)

%pintar imagenes
    subplot(1,2,1)
    imshow(IG);
    subplot(1,2,2)
    
    global imagen;
    imshow(imagen);

function filtromedia(IGm,pad)
    

    CopIGm=double(IGm);%copia imagen
    [fila,colum]=size(IGm);%tamaño de la imagen
    IGmF=IGm*0;%Matriz final en 0

       %For para recorrer filas y columnas
        for i=pad+1:1:fila-pad
            for j= pad+1:1:colum-pad

%                      %elegir ventana matriz de acuerdo si es par o impar   
%                     if comp==1%par
%                         ventana=CopIGm(i-(pad-1):i+pad, j-(pad-1):j+pad);
%                     elseif comp==0%impar

                        ventana=CopIGm(i-pad:i+pad, j-pad:j+pad);
                        vecventana = reshape(ventana,1,[]);
                        orgventana = sort(vecventana);
                        mediana = median(orgventana);
                    

%             prod=ventana .* mascara;%Producto punto de la ventana con la mascara
%             sprod=sum(prod,'all');%Sumatoria elementos matriz product


                IGmF(i,j)=mediana; %Nuevo valor del pixelo

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

    





