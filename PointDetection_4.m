image=imread('cameraman.tif');
figure(1);
imshow(image);
image=double(image);
mask=[-1,-1,-1;
    -1,8,-1;
    -1,-1,-1];
paddedImage=padarray(image,[1,1]);
paddedTemp=paddedImage;

[m,n]=size(paddedImage);

for i=2:m-1
    for j=2:n-1
        ;
        temp=mask.*paddedTemp(i-1:i+1,j-1:j+1);
        key=sum(temp(:));
        paddedImage(i,j)=key;
    end
end
[p,q]=size(image);
for i=1:p
    for j=1:q
        if(paddedImage(i,j)<127)
            paddedImage(i,j)=0;
        elseif(paddedImage(i,j)>127)
            paddedImage(i,j)=255;
        end
    end
end

figure(2);
imshow(uint8(paddedImage));
        
