function [stability, Rcm] = is_stable(Tower)
% INPUT:
% Tower : tower to analyze
% OUTPUT:
% stability : 1 OR 0
% Rcm : (1,3) array with the [x,y,z] position of the center of mass.
% USAGE:
% [stability, Rcm] = is_stable(Tower)
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

    % Usage: This function returns whether the tower is_stable or not, that is, if
    % after an infinite amount of time the tower will fall or it will not.
    % Algorithm
    % The center of mass of each and every combination is from above
    % all the way down must fall on a piece, otherwise the tower will fall,
    % so it will be checked from the highest pieces and all their possible
    % combinations down
    % [(height,3)] ->
    % [(height,3), (height,2)] -> 
    % [(height,3), (height,2),% (height,1)] ->
    % [(height,3), (height,2), (height,1), (height-1,3)] -> 
    % [(height,3), (height,2), (height,1), (height-1,3), (height-1,2)] ->
    % ... 
    % [... (2,3), (2,2), (2,1), (1,3), (1,2), (1,1)]
    height = calculate_height(Tower);
    piezas_estudiadas = [];
    % 1. We calculate the position of the center of mass of each of the
    % combinations studied
    for i = height:-1:1
        for j = 3:-1:1
            piezas_estudiadas = [piezas_estudiadas ;[i,j]];
            M =0;
            sumatory = [0 0 0];
            for el = 1:size(piezas_estudiadas,1)
                index_pieza_estudiada = piezas_estudiadas(el,:);
                pieza_estudiada = Tower(index_pieza_estudiada(1), index_pieza_estudiada(2),:);
                m = pieza_estudiada(1); x = pieza_estudiada(2); y = pieza_estudiada(3); z = pieza_estudiada(4);
                M = M + m; %sum of masses
                sumatory = sumatory + m*[x, y, z]; % vector summation
                if m ~=0
                    last_level_studied = index_pieza_estudiada(1);
                end
            end

            Rcm = sumatory/M;
            if isnan(Rcm)
                continue % In case the only place selected does not exist it continues
            end

            
            % 2. We check whether or not there is any support just below the center
            % mass 
            if within_the_base(Tower,last_level_studied-1,Rcm) == 0
                stability = 0;
                return
            end
        end
    end
    stability = 1;
end
