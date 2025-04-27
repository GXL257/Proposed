clc
clear
close all   
 addpath('C:\Users\PC\Desktop\公开的代码\mex\mexw64\');   
addpath('C:\Users\PC\Desktop\公开的代码\function\');
file_path1 ='C:\Users\PC\Desktop\公开的代码\data\1\';
%
% img_path_list1 =  dir(strcat(file_path1,'*.png'));%获取该文件夹中所有png格式的图像
img_path_list1 =  dir(strcat(file_path1,'*.bmp'));%获取该文件夹中所有png格式的图像
img_num = length(img_path_list1);%获取图像总数量  
L1=9; 
 M=7;


NN=floor(img_num/L1);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
KK=0;

for j=1:NN  
DD=[];zhih=[];B_C=[];mubiaoh=[];
    for count=1:L1 
        % picname=[file_path1 num2str((j-1)*L1+count,'%06d' ) '.png'];     
        picname=[file_path1 num2str((j-1)*L1+count ) '.bmp'];               
        Atu=imread(picname);
        img=Atu;
        if ndims( img ) == 3
                img = rgb2gray( img );      
        end
        img=im2double(img); 
        DD(count,:,:)=img; 
        [bian,zongtu2,chishimubiao]=getp(img);
        zhih(count,:,:)=bian; 

        mubiao=zongtu2.*img;
        BBB=img-mubiao;
       B_C(count,:,:)=BBB;
       mubiaoh(count,:,:)=chishimubiao;



    end

    [Lx, S] =svdfree4(DD,img,mubiaoh,zhih,B_C,M);
   S=mat2gray(S);
   mov=zeros(size(S));
   S_max = max(S, [], 1);
   S_max = squeeze(S_max);
   S_min = min(S, [], 1);
   S_min = squeeze(S_min);   
   S_max_min=S_max-S_min;  
   S_max_min = min(S_max_min, 1);
   matrix3D = repmat(S_max_min, [1, 1, L1]);
   matrix3D = permute(matrix3D, [3, 1, 2]);
   mov(matrix3D>0.2)=1;
   SH=S.*mov;
   for h=1:L1
             KK=KK+1;
       TH=SH(h,:,:);
       E=squeeze(TH);
       E=mat2gray(E);
       HHK=strcat(num2str(KK,'%06d'),'.png');
       figure(100);imshow(E,'border','tight');
       figure(101);mesh(E);
       ggg=1;
   end


end




   