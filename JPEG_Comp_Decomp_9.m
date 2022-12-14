img=imread('cameraman.tif');
figure(1);
imshow(img);
title('Original Image');

[m,n]=size(img);
img=double(img);
img=img-(128*ones(m,n));

quality=78;

Q50 = [ 16 11 10 16 24 40 51 61;
     12 12 14 19 26 58 60 55;
     14 13 16 24 40 57 69 56;
     14 17 22 29 51 87 80 62; 
     18 22 37 56 68 109 103 77;
     24 35 55 64 81 104 113 92;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];
 
if quality>50
    QX = round(Q50.*(ones(8)*((100-quality)/50)));
    QX = uint8(QX);
elseif quality<50
    QX = round(Q50.*(ones(8)*(50/quality)));
    QX = uint8(QX);
elseif quality==50
    QX = Q50;
end

DCT_matrix8 = dct(eye(8));
iDCT_matrix8 = DCT_matrix8'; 
dct_restored = zeros(m,n);
QX = double(QX);

for i1=[1:8:m]
    for i2=[1:8:n]
        zBLOCK=img(i1:i1+7,i2:i2+7);
        win1=DCT_matrix8*zBLOCK*iDCT_matrix8;
        dct_domain(i1:i1+7,i2:i2+7)=win1;
    end
end

for i1=[1:8:m]
    for i2=[1:8:n]
        win1 = dct_domain(i1:i1+7,i2:i2+7);
        win2=round(win1./QX);
        dct_quantized(i1:i1+7,i2:i2+7)=win2;
    end
end


figure(2);
imshow(dct_domain);

for i1=[1:8:m]
    for i2=[1:8:n]
        win2 = dct_quantized(i1:i1+7,i2:i2+7);
        win3 = win2.*QX;
        dct_dequantized(i1:i1+7,i2:i2+7) = win3;
    end
end

for i1=[1:8:m]
    for i2=[1:8:n]
        win3 = dct_dequantized(i1:i1+7,i2:i2+7);
        win4=iDCT_matrix8*win3*DCT_matrix8;
        dct_restored(i1:i1+7,i2:i2+7)=win4;
    end
end
I2=dct_restored;


K=mat2gray(I2);

figure(3);
title('Decompressed Image');
imshow(K);