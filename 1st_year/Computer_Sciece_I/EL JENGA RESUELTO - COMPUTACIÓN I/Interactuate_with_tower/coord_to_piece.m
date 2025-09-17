function [i,j] = coord_to_piece(x, y, z, Tower)    
% In this function we are going to pass the coordinates of the point that 
% we have established with the mouse click to a piece of the tower.
% INPUT:
% x : x-axis coordinates
% y : y-axis coordinates
% z : z-axis coordinates
% Tower : Jenga tower (heights)
% OUTPUT:
% i = row_; (part row coordinate)
% j = column_; (part column coordinate)
% USAGE:
% [i,j] = coord_to_piece(x, y, z, Tower)
% AUTHOR:
% Lucía García Echávarri

    % First we look for the row ( with the heights )
    [row_, a] = find(Tower(:,1,4) == z);

    % Depending on wheter the row is even or odd, we deduce the column
    if mod(row_,2) == 0     % "if" comand to know if it is even
        [b, column_] = find(Tower(row_,:,3) == y);
    else
        [b, column_] = find(Tower(row_,:,2) == x);
    end

    % return the results
    i = row_;
    j = column_;

end