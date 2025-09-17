function orientation_value = orientation(nivel)
% This function determines the orientation of the pieces by levels, they 
% can be oriented perpendicular to the 'x' axis or the 'y' axis
% INPUT:
% nivel : level of the tower (row of the hypermatrix tower)
% OUTPUT:
% orientation of the pieces 
% USAGE:
% orientacion = determinar_orientacion(nivel)
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

% Depending on whether the level is even or odd
        if mod(nivel,2) == 0
            orientation_value = 1;
        else
            orientation_value = 2;
        end
end