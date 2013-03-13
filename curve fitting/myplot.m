clear;
close all;
r_sim = csvread('data/gamm_025.csv');
r_eq = csvread('data/gamm_025_col');
r_eq_col = csvread('data/gamm_025');
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
ylim(axes1,[0 2.0]);

for i=1:1
    plot(r_eq_col,r_eq(:,i),'-k');
end


for i=1:10
    plot(r_sim(:,i*2-1),r_sim(:,i*2),'Marker','+','LineStyle','none','Color',[1 0 0]);
end

for i=2:10
    plot(r_eq_col,r_eq(:,i),'-k');
end
% Create xlabel
xlabel('Crossing angle $\varphi_{X}$','FontSize',16,'FontName','Times New Roman','Interpreter','latex');

% Create ylabel
ylabel('PDF','FontSize',16,'FontName','Times New Roman','Interpreter','latex');
legend1 = legend('Eq.12','Simulation');
set(legend1,'EdgeColor',[1 1 1],'YColor',[1 1 1],'XColor',[1 1 1],'FontName','Times New Roman');


% Create arrow
annotation(figure1,'arrow',...
    [0.27 0.27],...
    [0.3 0.55]);

    %[0.3 0.3],...
    %[0.3 0.7]);  
% Create textbox
annotation(figure1,'textbox',...
     [0.20 0.6 0.220430107526882 0.0852941176470585],...
    'String',{'$\kappa_{2}$ = [0.1:0.1:1]'},...
    'FontSize',14,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1],...
    'Interpreter','latex');




