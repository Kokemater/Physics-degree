function [deleted_piece, placed_piece] = random_move(Tower)
% This program will choose randomly one of the all possible pieces
% Input: 
% Tower: (n,3,4) Hypermatrix with the position and the mass of 
% all pieces
% Output: 
% deleted_piece : A pair [row, column] that indicates what piece to eliminate.
% placed piece : The position of the top layer to add the piece.
% Usage : 
% [deleted_piece, placed_piece] = random_move(Tower)
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

% ALGORYTHM 
% This is the simplest Jenga bot, since all the moves are random 
% It just choose a piece between that hasn't been chosen yet
% And it placed randomly to any free square at the top.


% Create an array of all the possible moves
allowed = allowed_pieces_to_remove(Tower);


% chose one of them randomly
move_index = randi(size(allowed, 1));
deleted_piece = allowed(move_index, :);

% Make a move randomly
    free_squares = free_squares_at_the_top(Tower);
    rand_index = randi(numel(free_squares));
    placed_piece = free_squares(rand_index);


end