clc;
clear all;
close all;

img = imread('cameraman.tif');

img = im2double(img)
k = 5;
sigma = 0.06;

% first octave
log1 = imgaussfilt(img,sigma);
log2 = imgaussfilt(img,k*sigma);
log3 = imgaussfilt(img,(k^2)*sigma);
log4 = imgaussfilt(img,(k^3)*sigma);
diff_11 = log1-log2;
diff_12 = log2-log3;
diff_13 = log3-log4;
figure();
subplot(421)
imshow(log1)
title('log1')
subplot(423)
imshow(log2)
title('log2')
subplot(425)
imshow(log3)
title('log3')
subplot(427)
imshow(log4)
title('log4')
subplot(424)
imshow(diff_11)
title('dog1')
subplot(426)
imshow(diff_12)
title('dog2')
subplot(428)
imshow(diff_13)
title('dog3')

% second octave
img1 = img(1:2:end,1:2:end);
log21 = imgaussfilt(img1,sigma);
log22 = imgaussfilt(img1,k*sigma);
log23 = imgaussfilt(img1,(k^2)*sigma);
log24 = imgaussfilt(img1,(k^3)*sigma);
diff_21 = log21-log22;
diff_22 = log22-log23;
diff_23 = log23-log24;
figure();
subplot(421)
imshow(log21)
title('log1')
subplot(423)
imshow(log22)
title('log2')
subplot(425)
imshow(log23)
title('log3')
subplot(427)
imshow(log24)
title('log4')
subplot(424)
imshow(diff_21)
title('dog1')
subplot(426)
imshow(diff_22)
title('dog2')
subplot(428)
imshow(diff_23)
title('dog3')

%% find exterma from DOG 
% in this scetion DOG image is used and extremum point is calculated
tic;
key=[];                             % empty matrix to store key points
x1=0;                               % local variables used to take if condition in account
y1=0;
z1=0;
f=0;
for i=2:511
    for j=2:511
%         x1=0;
% y1=0;
% z1=0;
        
    if (((diff_12(i,j)>diff_12(i-1,j))&&(diff_12(i,j)>diff_12(i+1,j))....
        &&(diff_12(i,j)>diff_12(i,j-1))&&(diff_12(i,j)>diff_12(i+1,j+1))....
        &&(diff_12(i,j)>diff_12(i-1,j-1))&&(diff_12(i,j)>diff_12(i-1,j+1))....
        &&(diff_12(i,j)>diff_12(i+1,j-1))&&(diff_12(i,j)>diff_12(i,j+1))))
        x1=x1+1;
    else
        continue;
    end
    if x1>0
        if((diff_12(i,j)>diff_13(i,j))&&(diff_12(i,j)>diff_13(i-1,j))....
            &&(diff_12(i,j)>diff_13(i+1,j))&&(diff_12(i,j)>diff_13(i,j-1))....
            &&(diff_12(i,j)>diff_13(i+1,j+1))&&(diff_12(i,j)>diff_13(i-1,j-1))....
            &&(diff_12(i,j)>diff_13(i-1,j+1))&&(diff_12(i,j)>diff_13(i+1,j-1))&&(diff_12(i,j)>diff_13(i,j+1)))
            y1=y1+1;
        else
            continue;
        
        end 
    end
%   if y1>0
%        
%     if ((diff_12(i,j)>diff_11(i,j))&&(diff_12(i,j)>diff_11(i-1,j))&&(diff_12(i,j)>diff_11(i+1,j))&&(diff_12(i,j)>diff_11(i,j-1))&&(diff_12(i,j)>diff_11(i+1,j+1))&&(diff_12(i,j)>diff_11(i-1,j-1))&&(diff_12(i,j)>diff_11(i-1,j+1))&&(diff_12(i,j)>diff_11(i+1,j-1))&&(diff_12(i,j)>diff_11(i,j+1)))
%         z1=z1+1;
%     else 
%         continue;
%     end
%   end
  
    key(i,j)=diff_12(i,j);                    % store key point location if it is maximum in its neighbourhood on same scale and also on scale above and below
    f=1;
  
    end
end
    
fprintf('\n Time for finding key points: %.3f s\n',toc) ;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
 
if f==0
    x=0;
    y=0;
    z=0;
    for i=2:511
        for j=2:511
        
            if (((diff_12(i,j)<diff_12(i-1,j))&&(diff_12(i,j)<diff_12(i+1,j))....
        &&(diff_12(i,j)<diff_12(i,j-1))&&(diff_12(i,j)<diff_12(i+1,j+1))....
        &&(diff_12(i,j)<diff_12(i-1,j-1))&&(diff_12(i,j)<diff_12(i-1,j+1))....
        &&(diff_12(i,j)<diff_12(i+1,j-1))&&(diff_12(i,j)<diff_12(i,j+1))))
                x=x+1;
            else
                continue;
            end
            if x>0
                if ((diff_12(i,j)<diff_13(i,j))&&(diff_12(i,j)<diff_13(i-1,j))....
            &&(diff_12(i,j)<diff_13(i+1,j))&&(diff_12(i,j)<diff_13(i,j-1))....
            &&(diff_12(i,j)<diff_13(i+1,j+1))&&(diff_12(i,j)<diff_13(i-1,j-1))....
            &&(diff_12(i,j)<diff_13(i-1,j+1))&&(diff_12(i,j)<diff_13(i+1,j-1))&&(diff_12(i,j)<diff_13(i,j+1)))
                    y=y+1;
                else
                    continue;
        
                end 
            end
            if y>0
      
   if ((diff_12(i,j)<diff_11(i,j))&&(diff_12(i,j)<diff_11(i-1,j))....
           &&(diff_12(i,j)<diff_11(i+1,j))&&(diff_12(i,j)<diff_11(i,j-1))....
           &&(diff_12(i,j)<diff_11(i+1,j+1))&&(diff_12(i,j)<diff_11(i-1,j-1))....
           &&(diff_12(i,j)<diff_11(i-1,j+1))&&(diff_12(i,j)<diff_11(i+1,j-1))&&(diff_12(i,j)<diff_11(i,j+1)))
       z=z+1;
   else 
       continue;
   end
  end
  
  key(i,j)=diff_12(i,j);                % store key point location if it is minimum in its neighbourhood on same scale and also on scale above and below
  
  
end
    end
  
   end
  
 key1=key*255;
 figure,imshow(key1);                   % show image key points 
 
 %% finding key point location
[key_m,key_n]=size(key);
  r=1;  
key_p=[];                               % matrix to store key points locations
for i=1:key_m
    for j=1:key_n
    
    if key(i,j)>0
%         key_p=[key_p,i,j];
           key_p(r,1)=i;                
           key_p(r,2)=j;
           r=r+1;
    end
end
end
fprintf('\n toatl numer of key points extracted are : \n')
length(key_p)
 
%% magnitude and phase calculation
for i=2:511
    for j=2:511
        mag_1(i,j)=((diff_12(i+1,j)-diff_12(i-1,j))^2)+((diff_12(i,j+1)-diff_12(i,j-1))^2);
        phase(i,j)=atan2((diff_12(i,j+1)-diff_11(i,j-1)),(diff_12(i+1,j)-diff_11(i-1,j)));      % phase of all pixels
    end
end
mag=sqrt(mag_1);                % magnitude of all pixel of diff_12 level 
%% FINDING  ORIENTATION
% in this section first complete phase is distributed in 36 bin each of 10
% degree(pi/18) and phase of all the points in 5*5 neighbourhood of key
% point are stored in the bins and their magnitude is added and max
% magnitude among them will become orientation of key point and wtih
% direction and magnitude
for k=1:length(key_p)
    
m=key_p(k,1);               % extract key point and store in m & n
n=key_p(k,2);
if (m<=2)||(n<=2)||(m>=509)||(n>=509)
    continue;
end
temp_mag=mag(m-2:m+2,n-2:n+2);          % 5*5 neighborhood of magnitude @ (m,n)
temp_phase=phase(m-2:m+2,n-2:n+2);      % 5*5 neighborhood of phase @ (m,n)
clear bin_p;
clear bin_m;
s=1;
     
for i=1:5
    for j=1:5
        k1=1;
        for x=1:36                      % 36 bin each of 10 degree
            if temp_phase(i,j)>-pi+(k1-1)*0.1745 && temp_phase(i,j)<-pi+0.1745*k1
                
                bin_p(k1,s)=temp_phase(i,j);
                bin_m(k1,s)=temp_mag(i,j);
                s=s+1;
            end
            bin_p(k1,s)=0;              % bin for phase value
            bin_m(k1,s)=0;              % bin for magnitude value
            %s=s+1;
            k1=k1+1;
           
        end
    end
end
for i=1:36
d1=sum(bin_m(i,:));
magv(i,k)=d1;                       % magnitude of bins
end
end
max_mag=max(magv);              % maximum magnitude value
for i=1:length(key_p)
    
    if max_mag(1,i)==0
        continue;
    end
    
    j=find(magv(:,i)==(max_mag(1,i)));
    
    
    max_mag(2,i)=j;             % matrix that store max magnitude value and their corresponding bin to get orientation of key points
end
   %% DESCRIPTOR..
   %in this section discreptor vector of key points are found, for this a
   %16*16 neighbourhood around key point is taken and this space is divided
   %in 16 4*4 matrix and for each 4*4 matrix 8 directional hostogram is
   %used to get eight orientation and magnitude so for each key point we
   %have 16*8=128 feature discriptor
   
   tic; 
   for k=1:length(key_p)
    magv_2=[];
m=key_p(k,1);               % extract key points location
n=key_p(k,2);
 if (m<=8)||(n<=8)||(m>=503)||(n>=503)
     continue;
 end
temp_mag_d=mag(m-7:m+8,n-7:n+8);            % form 16*16 neifghbour around key point
temp_phase_d=phase(m-7:m+8,n-7:n+8);
store_phase=[];
for i=1:4:13
    for j=1:4:13
        vijj=temp_mag_d(i:i+3,j:j+3);
        vijj_phase=temp_phase_d(i:i+3,j:j+3);
        
    %end
    store_phase=[store_phase,vijj_phase];
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    s=1;
    for i1=1:4                          % divide 16*16 region in 16 4*4 region
    for j1=1:4
        k1=1;
        for x=1:8                       % 8 bin each of 45 degree(pi/4)
            if vijj_phase(i1,j1)>-pi+(k1-1)*(pi/4) && vijj_phase(i1,j1)<-pi+(pi/4)*k1
                
                bin_p1(k1,s)=vijj_phase(i1,j1);
                bin_m1(k1,s)=vijj(i1,j1);
                s=s+1;
            end
            bin_p1(k1,s)=0;             % phase bin
            bin_m1(k1,s)=0;             % magnitude phase
            %s=s+1;
            k1=k1+1;
           
            
        end
    end
 end
for g=1:8
d2(:,1)=sum(bin_m1(g,:));
magv_2=[magv_2,d2];                 % magnitude of bins
end
    end
end
descriptor(k,:)=magv_2(:,:)';           % complete descriptor matrix for all key points.
    
   end