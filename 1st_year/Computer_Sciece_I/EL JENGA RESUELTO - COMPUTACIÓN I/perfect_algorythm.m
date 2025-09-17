function [deleted_piece, placed_piece, type_of_position] = perfect_algorythm(Tower, randomness_of_the_position, randomness_of_the_mass, player)
% This functions calls to combinatorial Jenga in case the position is not
% too random, otherwise it calls minimax.
% INPUT:
% Tower : (n,3,4) Hypermatrix with the mass and the position of 
% all pieces.
% randomness_of_the_position : randomness in the position of pieces
% randomness_of_the_mass : randomness in the mass of pieces
% player : type of player (maximizer or minimizer)
% OUTPUT:
% deleted_piece : A pair [row, column] that indicates what piece to eliminate.
% placed_piece : The position of the top layer to add the piece.
% type_of_position : Indicates who is winning the game in the actual position
% it has a value of 1 if in the current Tower the first player who 
% makes a move is winning, otherwise otherwise a 2.
% USAGE:
% [deleted_piece, placed_piece, type_of_position] = perfect_algorythm(Tower, randomness_of_the_position, randomness_of_the_mass, player)
% AUTHOR:
% Jorge Butragueño Nieto

height = calculate_height(Tower);


% IF IT IS TOO RANDOM CALL MINIMAX
if (randomness_of_the_mass ~= 0 || randomness_of_the_position > 2)

    % Depending on the position it will have a certain depth in order to
    % have a reasonable duration in a game.
    % This depth can have a higher value if we are interested in the
    % results no matter the time we have to wait. (This could last hours)
    if height == 2
        depth = inf; 
    elseif height > 2 && height <= 4
        depth = 6;
    elseif height > 4 && height <= 6
        depth =5;
    elseif height > 6 && height <= 8
        depth = 4;
    elseif height > 8 && height <= 10
        depth =3;
    elseif height > 10
        depth =2;
    end

    [deleted_piece, placed_piece, winner] = clever_minimax(Tower,depth,true);
    if winner == 0
        % Then we don't know yet
        type_of_position = -1;
    elseif winner ==1
        %Then it is a N-position
        type_of_position = 1;
    elseif winner == -1
        % Then it is a P-position
        type_of_position = 0;
    end
% IF IT IS NOT RANDOM ENOUGH CALL COMBINATORIAL JENGA
else
    [deleted_piece, placed_piece, type_of_position] = combinatorial_jenga(Tower);
end