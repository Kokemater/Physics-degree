function newTower = makeMove(Tower, move)
% This function simulates a move in the Jenga game and updates the tower state 
% accordingly. It is a fundamental part of the simulation and analysis process 
% in the game of Jenga.
% INPUT:
% Tower : (n,3,4) Hypermatrix with the mass and the position of 
% all pieces.
% move : int data with the number of moves of the game
% OUTPUT:
% newTower : Tower with the movement made
% USAGE:
% newTower = makeMove(Tower, move)
% AUTHOR:
% Jorge Butragueño Nieto


height = size(Tower,1);
newTower = Tower;

% Perform move by removing the specified piece (deleted_piece) from the current 
% position and placing its mass in the new specified position (placed_position).
deleted_piece = move(1:2);
placed_position = move(3);

% Check if a new layer has been completed on the tower.
% If all three positions in the new layer are occupied by pieces 
% (that is, they are not zero), a new layer is added to the tower using the 
% add_new_level function.
mass = newTower(deleted_piece(1), deleted_piece(2));
newTower(deleted_piece(1), deleted_piece(2)) = 0;
newTower(height,placed_position) = mass;
if newTower(height,1,1) ~= 0 && newTower(height,2,1) ~= 0 && newTower(height,3,1) ~= 0 
    newTower = add_new_level(newTower);
end



end