function move = generateMoves(Tower)
% This program contributes to strategic analysis and decision making in the game 
% of Jenga by generating possible moves that players can use to compete against each other.
% The generateMoves function takes as input the current state of the tower and 
% generates a list of possible moves.
% We use several helper functions to determine which pieces can be removed 
% (allowed_pieces_to_remove) and which spaces are free at the top of the tower 
% (free_squares_at_the_top).
% Finally, it generates all possible combinations of movements of removing and 
% placing pieces in free spaces.
% INPUT:
% Tower : (n,3,4) Hypermatrix with the mass and the position of 
% all pieces.
% OUTPUT:
% move : int data with the number of moves of the game
% USAGE:
% move = generateMoves(Tower)
% AUTHOR:
% Jorge Butragueño Nieto

height = calculate_height(Tower);
remove = allowed_pieces_to_remove(Tower);
place = free_squares_at_the_top(Tower); 
n_movement = 1;

for i = 1:size(remove,1)
    for j = 1: numel(place)
        if j ~=0
            move(n_movement,:) = [remove(i,:) place(j)];
            n_movement = n_movement+1;

        end

    end
end


end