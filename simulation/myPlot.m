clear;
close all;

load nbin_angle
load 'data/ncrosscollect.mat';



% ==========================
theta_ideal = linspace(0.00001,pi/2,100);


figure1 = figure('PaperType','<custom>','PaperSize',[5 4]);
axes1 = axes('Parent',figure1,'YGrid','on',...
    'XTick',[0 0.3926990818 0.7853981635 1.178097245 1.570796327],...
    'XTickLabel',{'0','p/8','p/4','3p/8','p/2'},...   
    'XGrid','on',...
    'FontSize',14,...
    'FontName','Symbol',...
    'position',[0.1 0.15 0.8 0.8]);
hold(axes1,'all');
% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[0 1.5708]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[0 2.5]);




for i=1:10
    k2 = 0.1*i;
    ftrue = (1+k2)/k2.*sin(theta_ideal).*cos(theta_ideal).^(1/k2);
    plot(theta_ideal,ftrue,'-k');
    plot(table_c{1}(:,i),table_n{1}(:,i),'Marker','+','LineStyle','none','Color',[1 0 0])
    
end

legend1 = legend('Eq.11','Simulation');
set(legend1,'EdgeColor',[1 1 1],'YColor',[1 1 1],'XColor',[1 1 1],...
    'FontName','Times New Roman');

% Create xlabel
xlabel('Crossing angle $\varphi_{X}$','FontSize',16,'FontName','Times New Roman','Interpreter','latex');
% Create ylabel
ylabel('PDF','FontSize',16,'FontName','Times New Roman');

% Create arrow
annotation(figure1,'arrow',[0.27 0.27],...
    [0.2 0.85]);

% Create textbox
annotation(figure1,'textbox',...
    [0.359139784946237 0.717647058823529 0.320430107526882 0.0852941176470585],...
    'String',{'$\kappa_{2}$ = [1:0.1,0.1]'},...
    'FontSize',14,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1],...
    'Interpreter','latex');


% ==========================
figure1 = figure('PaperType','<custom>','PaperSize',[5 4]);
axes1 = axes('Parent',figure1,'YGrid','on',...
     'XTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0],...
    'XGrid','on',...
    'FontSize',14,...
    'FontName','Times New Roman',...
    'position',[0.1 0.15 0.8 0.8]);
hold(axes1,'all');
% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[0.1 1]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[0.4 1]);


k2list = linspace(0.1,1,10);
E_eq = 1./(1+k2list);
plot(k2list,E_eq,'-k')


for i=1:10
    k2 = 0.1*i;
    n = [n_cross{1,i}.n_cross_mean - n_cross{1,i}.n_cross_std,
            n_cross{1,i}.n_cross_mean,
            n_cross{1,i}.n_cross_mean + n_cross{1,i}.n_cross_std];
    c = [k2,k2,k2];  
        
    plot(c,n,'Marker','o','LineStyle','-','Color',[1 0 0])
end
legend1 = legend('Eq.11','Simulation');
set(legend1,'EdgeColor',[1 1 1],'YColor',[1 1 1],'XColor',[1 1 1]);
% Create xlabel
xlabel('Uniformity parameter $\kappa_{2}$','FontSize',16,'FontName','Times New Roman','Interpreter','latex');
% Create ylabel
ylabel('PDF','FontSize',16,'FontName','Times New Roman');



% ==========================
figure1 = figure('PaperType','<custom>','PaperSize',[5 4]);
axes1 = axes('Parent',figure1,'YGrid','on',...
     'XTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0],...
    'XGrid','off',...
    'FontSize',14,...
    'FontName','Times New Roman',...
     'position',[0.1 0.15 0.8 0.8]);
hold(axes1,'all');
% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[0 1]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[0.2 1]);

Pi= 3.14159265358;
g2 = [0,Pi/8,Pi/3,Pi/4,3*Pi/8,Pi/6,Pi/2];
for j=1:7
k2list = linspace(0.1,1,10);
E_eq = 1./(1+k2list.^(1-g2(j)));
plot(k2list,E_eq,'-k')


for i=1:10
    k2 = 0.1*i;
    n = [n_cross{j,i}.n_cross_mean];
    c = [k2];  
        
    plot(c,n,'Marker','o','LineStyle','-','Color',[1 0 0])
end

end

legend1 = legend('Eq.12','Simulation');
set(legend1,'EdgeColor',[1 1 1],'YColor',[1 1 1],'XColor',[1 1 1]);
% Create xlabel
xlabel('Uniformity parameter $\kappa_{2}$',...
       'FontSize',16,...
       'FontName',...
       'Times New Roman',...
       'Interpreter','latex');
% Create ylabel
ylabel('Orientation factor $\alpha$','FontSize',16,'FontName','Times New Roman',...
    'Interpreter','latex');
% Create arrow
annotation(figure1,'arrow',[0.27 0.27],...
    [0.15 0.85]);

% Create textbox
annotation(figure1,'textbox',...
    [0.359139784946237 0.717647058823529 0.320430107526882 0.0852941176470585],...
    'String',{'$\gamma_{2}$ = [$\frac{\pi}{2}$,$\frac{3\pi}{8}$,$\frac{\pi}{3}$,$\frac{3\pi}{4}$,$\frac{\pi}{6}$,$\frac{\pi}{8}$,0]'},...
    'FontSize',14,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1],...
    'Interpreter','latex');