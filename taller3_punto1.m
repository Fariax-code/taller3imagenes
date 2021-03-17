%Taller 3 
%Integrantes: Santiago Farias- Gabriela Rojas
I = imread('img1.png');
IG = rgb2gray(I);


n=21;


pad=round(n/2)-1;

IGm=padarray(IG,[pad pad],0,'both');

CopIGm=double(IGm);%copia imagen
[fila,colum]=size(IGm);%tamaño de la imagen
IGmF=IGm*0;%Matriz final en 0



mascara = ones(n);
smasc=sum(mascara,'all');
gauss= [1 2 1,2 4 2, 1 2 1]/16;




for i=pad+1:1:fila-pad
    for j= pad+1:1:colum-pad
    ventana=CopIGm(i-pad:i+pad, j-pad:j+pad);
    prod=ventana .* (mascara/smasc);
    sprod=sum(prod,'all'); 
    IGmF(i,j)=sprod;
    
    end
end

 filainf = fila-pad-(pad-1);
 columfin = colum-pad-(pad-1);

 IGmF(1:pad,:)=[];
 IGmF(filainf:filainf+(pad-1),:)=[];
  
 IGmF(:,1:pad)=[];
 IGmF(:,columfin:columfin+(pad-1))=[];



figure(1)
subplot(1,2,1)
imshow(IG);
subplot(1,2,2)
imshow(IGmF);



% IG2=IGm(1:3,1:3);
% IG2=double(IG2);
% IG3= IG2.* mascara;
% C=sum(IG3,'all');

% IG4(1,1)=C;
% 
% [z,y] = find(IGm==53);

% filtro = arrayfun(@(x1)calfiltro(x1), IGm);

% function v=calfiltro(x)
% 
% % 
% % v=x+150;
% 
% % z=unit8(b);
% if x ~= 0
% 
% [fila,colum] = find(x);
% 
%   m(1,1)= x(fila-1+z,colum-1+z);
%   m(1,2)= x(fila-1+z,colum+z);
%   m(1,3)= x(fila-1+z,colum+1+z);
%   
%   m(2,1)= x(fila+z,colum-1+z);
%   m(2,2)= x(fila+z,colum+z);
%   m(2,3)= x(fila+z,colum+1+z);
%   
%   m(3,1)= x(fila+1+z,colum-1+z);
%   m(3,2)= x(fila+1+z,colum+z);
%   m(3,3)= x(fila+1+z,colum+1+z);
%   
%   multi=m.*mascara;
%   
%   suma=sum(multi,'all');
%  
%   v=suma;
% else
%     v=x;
% end
% 
% % if IGr ~= 0
% %   [z,y] = find(IGr);
% %   M(1,1)=x(z+1,y+1);
% % end
% 
% end

