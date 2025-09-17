function [deleted_piece, placed_piece, type_of_position] = clever_minimax(board, depth, maximizingPlayer)
% This function corrects minimax since when the computer
% determines that the game is over then it moves a random move
% and loses the chance to wait until the opponent commit a mistake
% INPUT:
% board : current state of the Jenga game board.
% depth : Maximum search depth in game tree. Controls how many levels of 
% decisions will be explored forward.
% maximizingPlayer : current player is maximizing or minimizing his score 
% in evaluating possible moves.
% OUTPUT:
% movement to be performed (deleted_piece, placed_piece)
% type of position associated with the movement (type_of_position)
% USAGE:
% [deleted_piece, placed_piece, type_of_position] = clever_minimax(board, depth, maximizingPlayer)
% AUTHOR:
% Jorge Butragueño Nieto

    [bestMove, type_of_position] = minimax(board, depth, maximizingPlayer);
    H_board = makeMove(board, bestMove);

    stability = is_stable(H_board);
    if stability == 0
        [deleted_piece, placed_piece] = safety_move(board);
    else
        deleted_piece = bestMove(1:2);
        placed_piece = bestMove(3);
    end
end
    