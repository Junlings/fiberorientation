function fg = gen_orient(fg,type,kappa1,kappa2)
% for now only the uniform spatial distribution case

nfib = fg.nfib; % total number of fiber within the group
fg.orient_kappa1 = kappa1;  % uniformity parameter for theta1
fg.orient_kappa2 = kappa2;  % uniformity parameter for theta2
fg.orient_type = type;      % distribution type


switch type
    case('random')
% random fiber arrays
    % for theta1, uniform distribution between 2*Pi
    ANG(:,1) = unifrnd(0,pi*2,nfib,1);
    
    % for theta2
    reg1=unifrnd(0,4,nfib,1);
    ANG_2 = acos(unifrnd(0,1,nfib,1));
    
    % map theta2 from Pi/2 to 2*Pi
    for i=1:(nfib)
        switch (floor(reg1(i)))
             case 0
             ANG(i,2)=((ANG_2(i)));
             case 1
             ANG(i,2)=pi-((ANG_2(i)));
            case 2
                ANG(i,2)=pi+((ANG_2(i)));
            case 3
               ANG(i,2)=2*pi-((ANG_2(i)));
        end
    end

    case ('strong_principal')
        % this corresponding to the case of strong axis
        % physical meaning of the prism with flow, both direction
        % perpendicular to the axis do not restrainted
        
        p_beta2 = 1/fg.orient_kappa2;
        
        ANG_t =unifrnd(0,pi*2,nfib,1);
        ANG_p =acos(beta_rand(0,1,p_beta2,1,[nfib,1]));

        ANG(:,1)=ANG_t;
        ANG(:,2)=ANG_p;

        reg2=unifrnd(0,4,nfib,1);
        
        for i=1:(nfib)
            switch (floor(reg2(i)))
             case 0
                ANG(i,2)=((ANG(i,2)));
             case 1
                ANG(i,2)=pi-((ANG(i,2)));
             case 2
                ANG(i,2)=pi+((ANG(i,2)));
             case 3
                ANG(i,2)=2*pi-((ANG(i,2)));
            end
        end
    
end

fg.ANG = ANG;
end

function [ r ] = beta_rand( m,n,A,B,v )
%BETA_RAND Summary of this function goes here
%   Detailed explanation goes here
R = betarnd(A,B,v);
r = -(m-n).*R;
end

