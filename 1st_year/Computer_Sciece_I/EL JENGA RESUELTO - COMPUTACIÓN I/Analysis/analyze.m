function analyze(scoresheet, initial_tower)
% This function simulates a series of moves in a Jenga game, evaluating the quality 
% of each move made by players and calculating the precision of their actions.
% INPUT:
% scoresheet : vector that save the movements
% initial_tower : initial tower to analyze
% OUTPUT:
% The program is executed
% USAGE:
% analyze(scoresheet, initial_tower, rand_pos, rand_mass)
% AUTHOR:
% Jorge Butragueño Nieto


    errors_player_1 = 0; big_errors_player_1 = 0; good_moves_player_1 = 0;
    errors_player_2 = 0; big_errors_player_2 = 0; good_moves_player_2 = 0;

    playing = true;
    % rebuild the tower
    figure
    Tower = initial_tower;
    % reconstruct the game
    % Analyze following this pattern:
    % N-position -> P-position (!) Good move
    % N-positin -> N-position (?) Error
    % P-position -> N-position (=) Ok 
    for movement = 1:size(scoresheet,1)
            height = size(Tower,1);
            input("continue: ");

            % type of position before the movement
            [ ~, ~,type_of_position_1] = combinatorial_jenga(Tower);
            move = scoresheet(movement,1);
            row = scoresheet(movement,2);
            column = scoresheet(movement,3);
            placed_piece = scoresheet(movement,4);
            mass = Tower(row,column,1);
            Tower(row,column, 1) = 0; 
            player = turn(move);
            
            [Tower, playing] = check(Tower,move,false); % check if Tower don't falls 
        if playing == true
            % type of position after the movement
            Tower = place_piece(placed_piece,Tower,mass);
            [ ~, ~,type_of_position_2] = combinatorial_jenga(Tower);
        end
        % SET IF THE MOVE WAS GOOD OR AN ERROR
        if type_of_position_1 == 1 && playing == false
            % (??) Fatal error
            analyze(1) = -2;
        elseif type_of_position_1 == 1 && type_of_position_2==1
            % Error (?)
            analyze(1) = -1;
        elseif (type_of_position_1 == 0 && type_of_position_2 == 1) || ...
                type_of_position_1 == 0 && playing == false
            % ok (=)
            analyze(1) = 0;

        elseif type_of_position_1 == 1 && type_of_position_2 ==0
            % Good move (!)
            analyze(1) = +1;
        end
        


        % CALCULATE THE ACCURACY

        if player ==1
            if analyze(1) == -1 
                errors_player_1 = errors_player_1 +1;
            elseif analyze(1) == -2
                big_errors_player_1 = big_errors_player_1 +1;
            else
                good_moves_player_1 = good_moves_player_1 +1;
            end
        else
            if analyze(1) == -1 
                errors_player_2 = errors_player_2 +1;
            elseif analyze(1) == -2
                big_errors_player_2 = big_errors_player_2 +1;
            else
                good_moves_player_2 = good_moves_player_2 +1;
            end
        end

        analyze(2) = type_of_position_2;
        [Tower] = check(Tower,move, false, analyze);
    end


    accuracy_1 = calculate_accuracy(good_moves_player_1, errors_player_1, big_errors_player_1);
    accuracy_2 = calculate_accuracy(good_moves_player_2, errors_player_2, big_errors_player_2);

    fprintf("Accuracy_of_player_1:  %3.3f  \n", accuracy_1)
    fprintf("Accruacy_of_player_2:  %3.3f  \n", accuracy_2)

end