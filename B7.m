image1=imread('cameraman.tif');
figure(1);
imshow(image1);
[m,n]=size(image1);

temp=imread('Desktop/lena_color_512.tif');
image2=rgb2gray(temp)
image2=imresize(image2,[256,256]);
figure(2);
imshow(image2);

final=zeros(m,n);

for i=1:n
    for j=1:m
        final(i,j)=image1(i,j)*image2(i,j);
        if(final(i,j)>255)
            final(i,j)=255;
        end
    end
end
final=cast(final,'uint8');
figure(3);
imshow(final);  