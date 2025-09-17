function [bestMove, bestScore] = minimax(board, depth, maximizingPlayer)
% This function make decisions in Jenga considering the stability of the 
% tower and the evaluation of possible moves.
% This function uses : 
% evaluate.m - generateMoves.m - newBoard.m - makeMove.m
% INPUT:
% board : Current state of the Jenga game board.
% depth : Maximum search depth in game tree. Controls how many levels of 
% decisions will be explored forward.
% maximizingPlayer : current player is maximizing or minimizing his score 
% in evaluating possible moves.
% OUTPUT:
% bestMove : best move found by minimax algorithm, which is determined after 
% exploring all possible combinations of movements up to the specified depth.
% BestScore : best move found. Represents the value of the board after 
% making the best move according to the minimax algorithm.
% USAGE:
% [bestMove, bestScore] = minimax(board, depth, maximizingPlayer)
% AUTHOR:
% Jorge Butragueño Nieto


    % Check if the game is over or maximum depth is reached
    stability = is_stable(board);
    if stability == 0 || depth == 0
        bestScore = evaluate(board,maximizingPlayer);
        bestMove = []; % No move to return at terminal nodes
        return;
    end
    
% If the player is the maximizer (maximizingPlayer is true), find the
% move that maximizes the evaluation score.
    if maximizingPlayer
        bestScore = -inf;
         
        possibleMoves = generateMoves(board);
        for move = 1:size(possibleMoves,1)
            newBoard = makeMove(board, possibleMoves(move,:));
            [~, score] = minimax(newBoard, depth - 1, false);
            if score > bestScore
                bestScore = score;
                bestMove = possibleMoves(move,:);
            end
        end
% If the player is the minimizer (maximizingPlayer is false), find the move
% that minimizes the evaluation score.
    else
        
        bestScore = inf;
        possibleMoves = generateMoves(board);
        for move = 1:size(possibleMoves,1)
            newBoard = makeMove(board, possibleMoves(move,:));
            [~, score] = minimax(newBoard, depth - 1, true);
            if score < bestScore
                bestScore = score;
                bestMove = possibleMoves(move,:);
            end
        end
    end
end