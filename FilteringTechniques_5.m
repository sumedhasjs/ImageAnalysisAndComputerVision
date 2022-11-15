image=imread('cameraman.tif');
noise1=imnoise(image,'gaussian');
figure(1);
subplot(2,1,1);
imshow(noise1);
noise2=imnoise(image,'salt & pepper');
subplot(2,1,2);
imshow(noise2);

avg_filt1=(1/9)*[1,1,1;
    1,1,1;
    1,1,1];

noise1_avg_1=conv2(noise1,avg_filt1);
noise2_avg_1=conv2(noise2,avg_filt1);
figure(2);
subplot(2,1,1);
imshow(uint8(noise1_avg_1));
subplot(2,1,2);
imshow(uint8(noise2_avg_1));


avg_filt2=(1/25)*[1,1,1,1,1;
    1,1,1,1,1;
    1,1,1,1,1;
    1,1,1,1,1;
    1,1,1,1,1];

noise1_avg_2=conv2(noise1,avg_filt2);
noise2_avg_2=conv2(noise2,avg_filt2);
figure(3);
subplot(2,1,1);
imshow(uint8(noise1_avg_2));
subplot(2,1,2);
imshow(uint8(noise2_avg_2));


noise1_med1=medfilt2(noise1,[3,3]);
noise2_med1=medfilt2(noise2,[3,3]);
figure(4);
subplot(2,1,1);
imshow(uint8(noise1_med1));
subplot(2,1,2);
imshow(uint8(noise2_med1));

noise1_med2=medfilt2(noise1,[5,5]);
noise2_med2=medfilt2(noise2,[5,5]);
figure(5);
subplot(2,1,1);
imshow(uint8(noise1_med2));
subplot(2,1,2);
imshow(uint8(noise2_med2));

