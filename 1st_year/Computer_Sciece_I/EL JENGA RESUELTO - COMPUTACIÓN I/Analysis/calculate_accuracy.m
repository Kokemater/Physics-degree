function accuracy_of_the_game = calculate_accuracy(good, error, big_error)
% This function gives the total accuracy of the player based on the chess
% model.
% INPUT:
% Type of move (good, error, big_error)
% OUTPUT:
% The program is executed
% USAGE:
% accuracy_of_the_game = calculate_accuracy(good, error, big_error)
% AUTHOR:
% Jorge Butragueño Nieto

 % Define weights for each type of move
    weight_good = 1;
    weight_error = 0.25;
    weight_big_error = 0.1;

    % Calculate weighted total
    weighted_total = (good * weight_good) + (error * weight_error) + (big_error * weight_big_error);

    % Total attempts
    total_attempts = good + error + big_error;

    % Accuracy calculation
    accuracy_of_the_game = (weighted_total / total_attempts) * 100;

end