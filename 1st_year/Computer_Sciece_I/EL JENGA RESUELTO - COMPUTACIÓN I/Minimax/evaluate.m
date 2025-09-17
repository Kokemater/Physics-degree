function score = evaluate(Tower,maximizing_player)
% This function determines the score associated with the current state of 
% the tower in the Jenga game, considering the stability of the tower and 
% the current player (either the maximizer or the minimizer).
% Returns +1 if player_1 wins, -1 if player_2 wins
% and zero if we don't know yet.
% INPUT:
% Tower : (n,3,4) Hypermatrix with the mass and the position of 
% all pieces.
% maximizing_player : type of player (maximizer) it is going to search for
% the highest score.
% OUTPUT:
% score : vector with the data of all scores
% USAGE:
% score = evaluate(Tower,maximizing_player)
% AUTHOR:
% Jorge Butragueño Nieto

if maximizing_player == true
    player = 1;
else
    player = 2;
end

stability = is_stable(Tower);
if stability == 1
    score = 0;
else
    if player ==1
        score = +1;
    else
        score = -1;
    end

end


end