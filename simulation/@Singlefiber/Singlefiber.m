classdef Singlefiber
    %single fiber
    %   Detailed explanation goes here
    
    properties
        Lf;
        df;
        LoH;
        Vf;
        XYZ;   %  coordinates of center
        ANG;   %  angles
        xline;
        yline;
        zline;
        sig;
    end
    
    methods
        function fb = Singlefiber(Lf,df)
           if nargin > 0 % Support calling with 0 arguments
              fb.Lf = Lf;
              fb.df = df;
              fb.LoH = Lf/df;
              fb.Vf = pi/4*Lf*(Lf/fb.LoH)^2;
          end 
        end
        
       print(fb);
       [ sig ] = sim_sig(fb,type,ta,ang_cross,lem)
    end

      
end

