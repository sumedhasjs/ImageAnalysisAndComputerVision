image=imread('cameraman.tif')
figure(1);
imshow(image);

threshold=mean2(image);
[m,n]=size(image);
for i=1:m
    for j=1:n
        if(image(i,j)>threshold)
            image(i,j)=255;
        else
            image(i,j)=0;
        end
    end
end

figure(2);
imshow(image);

image=imread('cameraman.tif')
k=3;
[L,centres]=imsegkmeans(image,k);
segment=labeloverlay(image,L);
figure(3);
imshow(segment);

L_l = superpixels(image,500);

figure(4);
subplot(2,1,1);
imshow(image);
h_l = drawpolygon('Position',[100,40; 150,35; 160,70; 150,200;  130,250; 50,250; 35,200; 50,70],'Color','g');
h2_l = drawrectangle(gca,'Position',[5 10 20 200],'color','r');
h3_l = drawrectangle(gca,'Position',[5 10 250 20],'color','b');
h4_l = drawrectangle(gca,'Position',[220,40,20,230],'color','r');


foreground = createMask(h_l,image);
background =  createMask(h2_l,image) + createMask(h4_l,image) + createMask(h3_l,image);
BW = lazysnapping(image,L_l,foreground,background);
figure(4);
subplot(2,1,2);
imshow(labeloverlay(image,BW,'Colormap',[1 0 0]));
sgtitle("Graph based image segmentation - Cameraman");

