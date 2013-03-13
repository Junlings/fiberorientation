function fg = ana_sig(fg,type,ta,kappa1,kappa2,gamm1,gamm2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Vf = fg.vf;
df = fg.fb.df;
lf = fg.fb.Lf;

Pi = 3.14159265358;
Af = df^2/4*Pi;

% get rc rs value based on kappa and fii value


sig_mean = -1;
sig_std = -1;

switch type
    case 'uniform'
        fii =gamm2;
        kappa = kappa2;
        [rc,rs] = rcrs( kappa,fii);
        
        
        sig_mean = 1/4*ta*Pi*df*Vf/Af/(1+kappa^(1-fii))*lf*...
            gamma(1/2*rc+1+1/2*rs)/gamma(1/2+1/2*rc)*...
            gamma(1/2*rc+1)/gamma(1/2*rc+3/2+1/2*rs);

        sig_std = Pi*(ta^2*df^2*Vf/Af/(1+kappa^(1-fii))*(1/12*lf^2*...
            (gamma(3/2+1/2*rc)*gamma(1+1/2*rc+1/2*rs)/gamma(1/2+1/2*rc)/...
            gamma(1/2*rc+2+1/2*rs)-gamma(1+1/2*rc+1/2*rs)^2/gamma(1/2+1/2*rc)^2*...
            gamma(1/2*rc+1)^2/gamma(1/2*rc+3/2+1/2*rs)^2)+1/48*...
            gamma(1+1/2*rc+1/2*rs)^2/gamma(1/2+1/2*rc)^2*gamma(1/2*rc+1)^2/...
            gamma(1/2*rc+3/2+1/2*rs)^2*lf^2))^(1/2);

end

        fg.sig_mean_ana = sig_mean;
        fg.sig_std_ana = sig_std;
        fg.rc = rc;
        fg.rs = rs;

end

function [ rc,rs ] = rcrs( kappa,fii )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
rc_table = [0.993985924610739,1.00223247243422,1.00374148830499,...
    1.00487243295706,1.01171136436864,1.01046838187446,...
    0.989825869747956;1.10521283526968,1.10716551879344,...
    1.09089697382748,1.00662847810583,0.955512545683307,...
    0.960064290279129,1.00207080249426;1.24474125890636,...
    1.25675351885609,1.20946094807784,1.01075696012073,...
    0.890730326770042,0.922210764022056,0.988288472192593;...
    1.42989201247526,1.45698463492934,1.37893432767925,...
    1.03816571238874,0.864150970666808,0.891033349749587,...
    0.997714170038162;1.65535866473285,1.64603310583958,...
    1.52940989356743,1.07411618606039,0.834355351963899,...
    0.851805524924490,1.00397937499365;1.99047567040937,...
    1.92892694563407,1.74171103149811,1.14965999315245,...
    0.834294966433076,0.839087990873537,1.01646662710993;...
    2.50268832307176,2.27192325780894,1.99436410299161,...
    1.24818206100644,0.861113385690889,0.838964268784383,...
    1.01614999675101;3.32171394874028,2.71372035672177,...
    2.31216764447780,1.46085992163468,0.951139293118186,...
    0.879189663600313,0.996140271076636;5.00797575348188,...
    3.52156399545862,2.78485837132386,1.81575926666239,...
    1.21049775890034,1.01625444857755,1.01248411372704;...
    9.99865002768209,5.41110782496019,4.26152372943463,...
    3.04651940210713,2.01842629583297,1.47141905259194,1.00236419948286;];

rs_table = [0.993150319856345,1.00574017800319,1.00860344599307,...
    0.995825536689627,1.00948725750024,1.00495798377357,...
    990240212723504;0.995844705127187,0.979149194182404,...
    0.966602678566783,0.935449792189952,0.969849139731606,...
    1.02012259434100,1.10950062432226;1.00412183209589,...
    0.976787334594852,0.939532323339392,0.864509819998607,...
    0.923319814502262,1.03985435039547,1.23426228790462;...
    1.00086104362443,0.987020092928833,0.945579667559301,...
    0.825316567722600,0.909405185768509,1.08388501109913,...
    1.43414594237795;0.992191333143979,0.975903842361310,...
    0.923367156849091,0.780189918987422,0.919561372048039,...
    1.14607477699029,1.67178245054074;0.999621519197504,...
    0.977792873127738,0.905778622110226,0.768937698002053,...
    0.954966300082796,1.27702710015764,2.00905918786724;...
    1.00127069523063,0.969769431914753,0.908200547667594,...
    0.790469042805697,1.05947664970065,1.44995691569924,...
    2.52419941294371;1.00244259972374,0.941160740055031,...
    0.910883229658894,0.927177601789095,1.30335389870492,...
    1.78515256621340,3.31037224484871;1.00577260875039,...
    0.941701482877856,0.961636853798285,1.25449520136261,...
    1.89895640649490,2.48098376529672,4.96893384187716;...
    1.00131481323364,1.08660525684177,1.38866416379924,...
    2.51173060774394,3.94658819371414,4.64381789622703,10.0077406133807;];

kappa_list = [1 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1];

Pi = 3.1415926;
fii_list = [0,0.125,0.1667,0.2500,0.3333,0.3750,0.5000].*Pi;


 [trash, index_row] = min(abs(kappa_list - kappa));
 [trash, index_column] = min(abs(fii_list - fii));

rc = rc_table(index_row,index_column);
rs = rs_table(index_row,index_column);

end