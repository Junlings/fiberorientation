function fg = gen_fiber(fg,fb,type,kappa1,kappa2)

if nargin == 1
    % regen the placement. repeating to get statistically
    fb = fg.fb;
    type = fg.orient_type;
    kappa1 = fg.orient_kappa1;
    kappa2 = fg.orient_kappa2;
    
else if nargin == 5
    % first time generation
    % calculate the total fiber number
    fg.nfib = round(fg.cube^3*fg.vf/fb.Vf);
    fg.fb = fb;

    end
end


% generate spatial distribution
fg = fg.gen_spatial();

% generate orientation distribution
fg = fg.gen_orient(type,kappa1,kappa2);


nfib = fg.nfib;
ANG = fg.ANG;
Lf = fb.Lf;


% initialize some arrays
fg.xline = zeros(2,nfib);
fg.yline = zeros(2,nfib);
fg.zline = zeros(2,nfib);

% calculate the two ends of the fibers
%{
for kf = 1:nfib
    coord = Lf/2*[cos(ANG(kf,2));
                  sin(ANG(kf,2))*cos(ANG(kf,1));
                  sin(ANG(kf,2))*sin(ANG(kf,1))];
    fg.xline(:,kf) = [-coord(1)+fg.XYZ(kf,1);coord(1)+fg.XYZ(kf,1)];
    fg.yline(:,kf) = [-coord(2)+fg.XYZ(kf,2);coord(2)+fg.XYZ(kf,2)];
    fg.zline(:,kf) = [-coord(3)+fg.XYZ(kf,3);coord(3)+fg.XYZ(kf,3)];
    
end
%}

ANG(:,3)=acos(abs(1/Lf*(fg.xline(1,:)-fg.xline(2,:))));

fg.ANG = ANG;

end