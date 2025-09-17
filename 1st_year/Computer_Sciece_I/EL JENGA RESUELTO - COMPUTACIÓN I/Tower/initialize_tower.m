function Tower = initialize_tower(altura,randomness_position, randomness_mass)
% This function initializes a tower with a given height and some degree of 
% randomness in the position and mass of the pieces.
% INPUT:
% altura : tower height
% randomness_position : randomness in the vertical position of the pieces
% randomness_mass : randomness in the vertical position of the pieces
% OUTPUT:
% Tower : initialized tower
% USAGE:
% Tower = initialize_tower(altura,randomness_position, randomness_mass)
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

% Create a 'Pieces' data structure as a cell with three columns and row 
% heights to represent the pieces of the tower.
Pieces = cell(altura,3); 
Pieces{1,2} = [0 0 0]; % The center at the bottom
Pieces{1,1} = Pieces{1,2} + [-2.5, 0, 0]; % Left at the bottom
Pieces{1,3} = Pieces{1,2} + [2.5, 0, 0]; % Right down all the way

for nivel = 2:altura
        orientacion= orientation(nivel);
    % the orientation of the part is determined (1 if it expands towards the x axis, 
    % 2 if it expands towards the x axis)

    dificultad = randi([-randomness_position,randomness_position]) * 0.1; % POSITION RANDOMITY (0 to 3)
    Pieces{nivel,2} = Pieces{nivel-1,2} + [0 0 1.5] + [dificultad, dificultad, 0]; % build the tower
        if orientacion == 1
        Pieces{nivel,1} = Pieces{nivel,2} + [0 -2.5 0];
        Pieces{nivel,3} = Pieces{nivel,2} + [0 2.5 0];
        else
        Pieces{nivel,1} = Pieces{nivel,2} + [-2.5 0 0];
        Pieces{nivel,3} = Pieces{nivel,2} + [2.5 0 0];
        end 

end



Tower(:,:,1) = ones(altura,3) + randi([0, randomness_mass], altura,3); % MASS RANDOMITY (FROM 0 TO 2)
for i = 1:altura
    for j = 1:3
        Tower(i,j,2) = Pieces{i,j}(1);
        Tower(i,j,3) = Pieces{i,j}(2);
        Tower(i,j,4) = Pieces{i,j}(3);
    end
end

end