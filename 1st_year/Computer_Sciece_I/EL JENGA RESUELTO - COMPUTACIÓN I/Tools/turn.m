function [player, maximizer] = turn(move)
% This function determines which player is making a move in the game of 
% Jenga and whether the player is the maximizer in the context of search 
% algorithms such as minimax.
% INPUT:
% move : int data with the number of moves of the game
% OUTPUT:
% player : number of the player who is making the move
% maximizer : indicates whether the player is the maximizer or not.
% USAGE:
% [player, maximizer] = turn(move)
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

if mod(move,2) ~= 0
    player = 1;
    maximizer = true;
else
    player =2;
    maximizer = false;
end
end