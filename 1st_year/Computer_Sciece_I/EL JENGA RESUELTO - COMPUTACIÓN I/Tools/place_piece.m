function Tower = place_piece(position,Tower,mass)
% Update Tower  to place a piece in the top position
% INPUT:
% position : column of the tower where you like put the piece
% Tower : (n,3,4) Hypermatrix with the mass and the position of 
% all pieces.
% mass : mass of the piece (1)
% OUTPUT:
% Tower : updated tower
% USAGE:
% Tower = place_piece(position,Tower,mass)
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

top = size(Tower,1);
Tower(top,position,1) = mass; 

end