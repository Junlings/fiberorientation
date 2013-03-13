clear;
close all;


[ga,k2] = meshgrid(0:pi/16:pi/2,0.1:0.05:1);
s_mean = zeros(length(ga),length(ga(1,:)));
s_std = zeros(length(ga),length(ga(1,:)));
for i =1:length(ga)
    for j = 1:length(ga(i,:))
     [s_mean(i,j),s_std(i,j)] = cal_stress(ga(i,j),k2(i,j));
    end
end

figure1 = figure('PaperType','<custom>','PaperSize',[5 4]);

axes1 = axes('Parent',figure1,'XTickLabel',{'0','p/8','p/4','3p/8','p/2'},...
    'XTick',[0 0.392699081698724 0.785398163397448 1.17809724509617 1.5707963267949],...
    'Position',[0.1 0.15 0.8 0.8],...
    'Layer','top',...
    'FontSize',14,...
    'FontName','Symbol');


box(axes1,'on');
grid(axes1,'on');
hold(axes1,'all');
[C,h] = contour(ga,k2,s_mean);
clabel(C,h);
colormap('Gray');
xlabel('Orientation of cut plane $\gamma_{2}$','FontSize',16,'FontName','Times New Roman','Interpreter','latex')
ylabel('Uniformity parameter $\kappa_{2}$','FontSize',16,'FontName','Times New Roman','Interpreter','latex')
%title('Contour of the mean of Ultimate stress')
% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[0 1.58]);
% Uncomment the following line to preserve the Y-limits of the axes



figure1 = figure('PaperType','<custom>','PaperSize',[5 4]);                
axes1 = axes('Parent',figure1,'XTickLabel',{'0','p/8','p/4','3p/8','p/2'},...
    'XTick',[0 0.392699081698724 0.785398163397448 1.17809724509617 1.5707963267949],...
    'Position',[0.1 0.15 0.8 0.8],...
    'Layer','top',...
    'FontSize',14,...
    'FontName','Symbol');

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'all');
[C,h] = contour(ga,k2,s_std);
clabel(C,h);

colormap('Gray');
xlabel('Orientation of cut plane $\gamma_{2}$','FontSize',16,'FontName','Times New Roman','Interpreter','latex')
ylabel('Uniformity parameter $\kappa_{2}$','FontSize',16,'FontName','Times New Roman','Interpreter','latex')
%title('Contour of the standard deviation of Ultimate stress')
% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[0 1.58]);
% Uncomment the following line to preserve the Y-limits of the axes
