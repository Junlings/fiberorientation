function fg = cross_check(fg,gamm1,gamm2)
   
    % based on the complete fiber distribution in space defined in res
    % to generate the crossing subgroup based on cut plane defined by 
    %                                        (gamm1,gamm2)
    
    ANG = fg.ANG;
    %xline = fg.xline;
    %yline = fg.yline;
    %zline = fg.zline;
    XYZ = fg.XYZ;
    lf = fg.fb.Lf;


    fib_cross=1:length(XYZ(:,3));
   
    lc=cos(gamm2);
    mc=sin(gamm2)*cos(gamm1);
    nc=sin(gamm2)*sin(gamm1);
        
    fib_final=[];
    angle_cross=[];
    embedlength=[];
    inter = [];
    maxdisc = [];
    
% over all fibers to calculate the intersection point
for kf = fib_cross,
    x0=XYZ(kf,1);
    y0=XYZ(kf,2);
    z0=XYZ(kf,3);
    
    % if the center of fiber is to away from the center of [1,1,1]
    % then no need to check the crossing, to accelerate
    if ((x0-1)^2+(z0-1)^2+(y0-1)^2)>1
        continue;
    end
    
    % calculate the direction cosine for each individual fiber
    l=cos(ANG(kf,2));
    m=sin(ANG(kf,2))*cos(ANG(kf,1));
    n=sin(ANG(kf,2))*sin(ANG(kf,1));

    
    % calculate the intersection
    xint =(m*x0*mc+x0*n*nc+l*nc+lc*l+l*mc-l*z0*nc-l*y0*mc)/(m*mc+n*nc+lc*l);
    yint =(m*nc-lc*m*x0+m*lc+m*mc-z0*m*nc+n*y0*nc+lc*l*y0)/(m*mc+n*nc+lc*l);
    zint =(m*mc*z0+n*nc-n*lc*x0+n*lc+n*mc+lc*l*z0-mc*n*y0)/(m*mc+n*nc+lc*l);
    
    % calculate the intersection point distance from the center of [1,1,1]
    in_cut=sqrt((xint-1)^2+(yint-1)^2+(zint-1)^2)<0.5641;
    
    % 
    if in_cut ~= 1
        continue;
    end
    % calculate the distance of the intersection to the two end points
    disctmax = sqrt((xint-x0)^2+(yint-y0)^2+(zint-z0)^2);

    in_line=disctmax<=lf/2;

    % pick up those fiber meet both criteria
    if  in_cut==1 && in_line==1
        coord = lf/2*[cos(ANG(kf,2));
        sin(ANG(kf,2))*cos(ANG(kf,1));
        sin(ANG(kf,2))*sin(ANG(kf,1))];
        xline(:,kf) = [-coord(1)+fg.XYZ(kf,1);coord(1)+fg.XYZ(kf,1)];
        yline(:,kf) = [-coord(2)+fg.XYZ(kf,2);coord(2)+fg.XYZ(kf,2)];
        zline(:,kf) = [-coord(3)+fg.XYZ(kf,3);coord(3)+fg.XYZ(kf,3)];        
        
        angle=pi/2-asin(abs(lc*l+mc*m+nc*n/sqrt((l^2+m^2+n^2)*(lc^2+mc^2+nc^2))));
        embed=min(abs(lc*xline(1,kf)+mc*yline(1,kf)+nc*zline(1,kf)-(lc+mc+nc)),abs(lc*xline(2,kf)+mc*yline(2,kf)+nc*zline(2,kf)-(lc+mc+nc)));
    
        embed = embed/cos(angle);
        fib_final = [fib_final kf];
        angle_cross=[angle_cross angle];
        embedlength=[embedlength embed];
        inter = [inter [xint;yint;zint;]];
        maxdisc = [maxdisc disctmax];
        
        


    else

    end

end
        fg.lem = embedlength;
        fg.ang_cross = angle_cross;
        fg.n_cross = length(fib_final);
        fg.fib_final = fib_final;
        fg.inter = inter;
        fg.maxdisc = maxdisc;
end
