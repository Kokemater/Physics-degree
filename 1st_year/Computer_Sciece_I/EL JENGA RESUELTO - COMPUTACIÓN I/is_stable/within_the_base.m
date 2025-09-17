function within = within_the_base(Torre,nivel,Rcm) 
% This function calculates if the Rcm is in the imaginary base
% INPUT:
% Torre : tower to analyze
% nivel : level of the tower
% Rcm : (1,3) array with the [x,y,z] position of the center of mass.
% OUTPUT:
% dentro : if under Rcm is any piece (1 or 0) 
% USAGE:
% dentro = dentro_de_la_base_de_apoyo(Torre,nivel,Rcm) 
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

        medio_largo = 7.5/2;
        medio_ancho = 2.5/2;
       
         if nivel == 0
                within = 1; % If it reaches the ground there is clearly support
             return
         end

% We consider the orientation of the level to calculate the limits of the support 
% base and check if the point falls within these limits.
orientacion = orientation(nivel); %calculate the orientation of the level

 
            index = 1;
            %x = zeros(3,1); %initialize x
            %y = zeros(3,1); %initialize y
            for i = 1:3
                if Torre(nivel,i,1) ~= 0
                x(index) = Torre(nivel,i,2);
                y(index) = Torre(nivel,i,3);
                %z(index)= Torre(nivel,i,4);
                index = index +1;
                end                
            end

             if index ==1
                within = 0; % if there are no pieces then it will fall
                return
            end
            if orientacion == 1
            x_min = min(x)- medio_largo;
            x_max = max(x)+ medio_largo;
            y_min = min(y) - medio_ancho;
            y_max = max(y) + medio_ancho;
            else
            x_min = min(x)- medio_ancho;
            x_max = max(x) + medio_ancho;
            y_min = min(y) - medio_largo;
            y_max = max(y) + medio_largo;
            end
            
% 
            if Rcm(1) <= x_max && Rcm(1) >= x_min && Rcm(2) <= y_max && Rcm(2) >= y_min
                within = 1;
                return
            else
                within = 0; % If the point is not within the calculated limits
                return
            end
end
  