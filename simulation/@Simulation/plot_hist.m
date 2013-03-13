function  plot_hist(sim,range,item)
%function to estimate the post crack bridging force
%   inpurres  : input sampling dataset
%   ta        : uniform distributed interfacial stress



switch item
    case 'ang_cross'
        ang = [];
        for i=1:range
            ang= [ang sim.fgn{i}.ang_cross];
        end
        % histogram plot of the orientation of the fiber crossing
        figure;
        [fh,xh,flo,fup] = ecdf(ang);
        ecdfhist(fh,xh,20);
        [N,C] = ecdfhist(fh,xh,20);
        title('ang');
        
        k2 = sim.fgn{1}.orient_kappa2;
        theta_ideal = linspace(0.00001,pi/2,100);
        hold on;
        ftrue = (1+k2)/k2.*sin(theta_ideal).*cos(theta_ideal).^(1/k2);
        plot(theta_ideal,ftrue,'r-.');        
        
    case 'lem'
        lem = [];
        for i=1:range
            lem = [lem sim.fgn{i}.lem];
        end        
        % histogram of the embedment length
        figure;
        [fh,xh,flo,fup] = ecdf(lem);
        [N,C] = ecdfhist(fh,xh,20);
        title('lem');   
        
    case 'n_cross'
        n_cross = [];   
    
        for i=1:range
            n_cross = [n_cross sim.fgn{i}.n_cross/400];
        end   
        % histogram of the number of fiber crossing
        figure;
        [fh,xh,flo,fup] = ecdf(n_cross);
        [N,C] = ecdfhist(fh,xh,20);
        title('n_cross');
end


end

