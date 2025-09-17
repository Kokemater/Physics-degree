function height = calculate_height(Tower)
% This function calculates the height of the tower
% Input:
% Tower : (n,3,4) Hypermatrix with the position and the mass of 
% all pieces
% Output :
% Height : int data, of the height of the Tower.
% Usage :
% height = calculate_height(Tower)
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

height = size(Tower,1);
if Tower(height, :,1) == [0 0 0]
    height = height -1;
end
end