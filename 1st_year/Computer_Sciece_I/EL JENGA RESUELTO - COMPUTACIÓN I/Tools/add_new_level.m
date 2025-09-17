function Tower = add_new_level(Tower)
% This function adds a new level
% INPUT:
% Tower : (n,3,4) Hypermatrix with the mass and the position of 
% all pieces.
% OUTPUT:
% Tower : with a new level on the top
% USAGE:
% Tower = add_new_level(Tower)
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri


i = size(Tower,1) +1;
    orientation_ = orientation(i);

    Tower(i,:,1) = 0; % initialize the level


    % The second piece center (x,y) is always going to be the same no matter the
    % orientation, so we simply add +1.5 per level.
    x_2 = Tower(i-1,2,2);  y_2 = Tower(i-1,2,3); z_2 = Tower(i-1,2,4) + 1.5;
    Tower(i,2,2) = x_2; Tower(i,2,3) = y_2; Tower(i,2,4) = z_2;
    if orientation_ == 1
    % Set the position in X, Y, Z of the piece (i,1)
    Tower(i,1,2) = Tower(i,2,2); 
    Tower(i,1,3) = Tower(i,2,3) -2.5;
    Tower(i,1,4) = Tower(i,2,4);
    % Set the position in X, Y, Z of the piece (i,3)
    Tower(i,3,2) = Tower(i,2,2); 
    Tower(i,3,3) = Tower(i,2,3) +2.5;
    Tower(i,3,4) = Tower(i,2,4);
    
    else
    % Set the position in X, Y, Z of the piece (i,1)
    Tower(i,1,2) = Tower(i,2,2) -2.5; 
    Tower(i,1,3) = Tower(i,2,3);
    Tower(i,1,4) = Tower(i,2,4);
    % Set the position in X, Y, Z of the piece (i,3)
    Tower(i,3,2) = Tower(i,2,2)+2.5; 
    Tower(i,3,3) = Tower(i,2,3);
    Tower(i,3,4) = Tower(i,2,4);
    end 
end
