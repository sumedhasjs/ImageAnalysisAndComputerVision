image1=imread('cameraman.tif');
figure(1);
imshow(image1);
[m,n]=size(image1);

temp=imread('Desktop/lena_color_512.tif');
image2=rgb2gray(temp)
image2=imresize(image2,[256,256]);
figure(2);
imshow(image2);

final1=zeros(m,n);
final2=zeros(m,n);
for i=1:n
    for j=1:m
        final1(i,j)=image1(i,j)-image2(i,j);
        if(final1(i,j)>0)
            final1(i,j)=0;
        end
        final2(i,j)=image2(i,j)-image1(i,j);
        if(final2(i,j)<0)
            final2(i,j)=0;
        end
    end
end
final1=cast(final1,'uint8');
figure(3);
imshow(final1);  

final2=cast(final2,'uint8');
figure(4);
imshow(final2);