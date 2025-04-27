function X = soft_threshold(X, sigma)
%softThresh Soft thresholding function
%   X = soft_threshold(X, sigma)
temp = X-sigma;
temp(temp<0) = 0;
% TH=temp(1,:,:); E=squeeze(TH);figure(1);imshow(E,[]);title('进行收缩后残余的');
X = temp.*sign(X);
% TH=X(1,:,:); E=squeeze(TH);figure(2);imshow(E,[]);title('与原目标乘上的');
hhhh=1;
% X(abs(X)>sigma) = X(abs(X)>sigma) - sign(X(abs(X)>sigma)).*sigma;
end