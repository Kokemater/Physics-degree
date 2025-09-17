function [deleted_piece, placed_piece, good_moves_remaining]  = good_moves_minimizer(Tower)
% This function will select a move for the tower provided that
% Tower won't fall unless there are no option. 
% In that case it will chose a random move.
% Move is chosen by following the principle: Try to minimyze my oponent
% good moves.
% INPUT:
% Tower : (n,3,4) Hypermatrix with the position and the mass of 
% all pieces
% OUTPUT:
% deleted_piece : A pair [row, column] that indicates what piece to eliminate.
% placed_piece : The position of the top layer to add the piece.
% good_moves_remaining : if there are movements considered 'good' (true), 
% on the contrary (false) if not
% USAGE:
% [deleted_piece, placed_piece, good_moves_remaining] = good_moves_minimizer(Tower)
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

height = size(Tower,1);
H_Tower = Tower; % Hypothetical Tower




%% Study all the allowed_and_good_moves on this round

allowed_deleted_piece = allowed_pieces_to_remove(Tower);
[~, ~, allowed] = safety_move(Tower);
allowed_and_good_deleted_piece = allowed(:,1:2);
allowed_and_good_top_position = allowed(:,3:5);

n_possible_moves = ones(size(allowed,1), 3)*inf;
         
%% Study the good moves on the next round


if numel(find(allowed_and_good_deleted_piece ~= 0)) == 0|| numel(find(allowed_and_good_top_position ~= 0)) == 0

    deleted_index = randi(size(allowed_deleted_piece, 1));
    deleted_piece = allowed_deleted_piece(deleted_index, :);
    options = free_squares_at_the_top(Tower);
    placed_piece = options(1);
else
    for i = 1:size(allowed,1)
    mass = H_Tower(allowed_and_good_deleted_piece(i,1), allowed_and_good_deleted_piece(i,2)); 
    H_Tower(allowed_and_good_deleted_piece(i,1), allowed_and_good_deleted_piece(i,2)) =0;
        for j = 1:3
            if allowed_and_good_top_position(i, j) ~= 0
                H_Tower(height, allowed_and_good_top_position(i,j)) =mass;
                [~, ~, allowed_2] = safety_move(H_Tower);
                n_possible_moves(i,j) = size(allowed_2,1);
                H_Tower(height, allowed_and_good_top_position(i,j)) =0;
            end
        end
     H_Tower(allowed_and_good_deleted_piece(i,1), allowed_and_good_deleted_piece(i,2)) =mass;

    end
    % The value that minimizes the possible movements for the next turn

    good_moves_remaining = min(n_possible_moves(:));
    [deleted, placed] = find(n_possible_moves == good_moves_remaining,1);
    deleted_piece = allowed_and_good_deleted_piece(deleted,:);
    placed_piece = allowed_and_good_top_position(deleted,placed);
    %fprintf("You only have %d aviable moves", good_moves_remaining)

end


end