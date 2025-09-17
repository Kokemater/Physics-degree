function squares = free_squares_at_the_top(Tower)
% This function determines which squares are available at the top of the 
% tower to place new pieces
% INPUT:
% Tower : (n,3,4) Hypermatrix with the mass and the position of 
% all pieces.
% OUTPUT:
% squares : vector containing the indices of the squares that are free at 
% the top of the tower
% USAGE:
% squares = free_squares_at_the_top(Tower)
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

height = calculate_height(Tower);
if height < size(Tower,1)
    % This means that there is one full empty level
    squares = [1 2 3];
else
    %If the tower is complete at the top (i.e. there are no empty levels),
    % find the squares that are currently empty on the top level
    squares = find(Tower(height,:,1) ==0);
    if numel(squares) == 0
        squares = [1 2 3];
    end
end
end