function plot_single_angle(fg)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
ANG = fg.ANG;

figure;
subplot(3,1,1);
[fh,xh,flo,fup] = ecdf(ANG(:,1));
ecdfhist(fh,xh,20);
title('ANG1');

subplot(3,1,2);
[fh,xh,flo,fup] = ecdf(ANG(:,2));
ecdfhist(fh,xh,20);
title('ANG2');

subplot(3,1,3);
[fh,xh,flo,fup] = ecdf(ANG(:,3));
ecdfhist(fh,xh,20);
hold on;
theta_ideal = linspace(0.00001,pi/2,100);
ftrue = sin(theta_ideal);
ftrue2 = sin(theta_ideal);
plot(theta_ideal,ftrue,'r-.');
plot(theta_ideal,ftrue2,'r-.');
title('ANG3');

end


