function plot_single_crossing(fg,gamm1,gamm2)
% plot the crossing fiber within the cube
cube = fg.cube;

fib_final = fg.fib_final;
xline = fg.xline;
yline = fg.yline;
zline = fg.zline;


vertex = [0 0 0;
          cube 0 0;
          cube cube 0;
          0 cube 0;
          0 0 cube;
          cube 0 cube;
          cube cube cube;
          0 cube cube];
faces = [1 2 6 5;
         2 3 7 6;
         3 4 8 7;
         4 1 5 8;
         1 2 3 4;
         5 6 7 8];
figure;
view(3);
patch('Vertices',vertex,'Faces',faces,'FaceColor','none');
axis equal;
xlabel('x');
ylabel('y');
zlabel('z');
hold on;

h=circle3([1,1,1],0.5641,1000,'--r');
xdir = [1 0 0];
rotate(h,xdir,90);
zdir = [0 0 1];
rotate(h,zdir,90);
zdir = [0 0 1];
rotate(h,zdir,gamm2/pi*180);  % rotation in deg
xdir = [1 0 0];
rotate(h,xdir,gamm1/pi*180);  % rotation in deg
%{
xdir = [1 0 0];
rotate(h,xdir,90);
zdir = [0 0 1];
rotate(h,zdir,90);
zdir = [0 0 1];
rotate(h,zdir,gamm1/pi*180);  % rotation in deg
ydir = [0 1 0];
rotate(h,ydir,-gamm2/pi*180);  % rotation in deg
%}

grid on;
for kf = fib_final,
    line(xline(:,kf),yline(:,kf),zline(:,kf), ...
        'Color','g','LineWidth',1.75,'LineStyle','-');
end

end

function H=circle3(center,radius,NOP,style)
%---------------------------------------------------------------------------------------------
% H=CIRCLE(CENTER,RADIUS,NOP,STYLE)
% This routine draws a circle with center defined as
% a vector CENTER, radius as a scaler RADIS. NOP is 
% the number of points on the circle.
%
% Examples,
%
%   circle([1,3,1],3,1000,':'); 
%   circle([2,4,1],2,1000,'--');
%
%   Ahmed Ferozpuri <aferozpu@gmu.edu>
%   Version 1.00
%   May 25, 2006
%---------------------------------------------------------------------------------------------

if (nargin <3),
 error('Please see help for INPUT DATA.');
elseif (nargin==3)
    style='b-';
end;
THETA=linspace(0,2*pi,NOP);
RHO=ones(1,NOP)*radius;
[X,Y] = pol2cart(THETA,RHO);
X=X+center(1);
Y=Y+center(2);
Z = center(3)*ones(1,length(X));
%H=plot3(X,Y,Z,style);
H=patch(X,Y,Z,[[0.75 0.75 0.75]]);
axis square;
end