% This simulate 1000 games between each AI
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri
clear all
clc
clf
close all

tic 

% ADD PATHS
ruta_actual = fileparts(which("AI_Tournament.m"));
Minimax_path = addpath(fullfile(ruta_actual, 'Minimax'));
Tools_path = addpath(fullfile(ruta_actual, 'Tools'));
Combinatorial_jenga_path = addpath(fullfile(ruta_actual, 'Combinatorial_Jenga'));
is_stable_path = addpath(fullfile(ruta_actual, 'is_stable'));
Tower_path = addpath(fullfile(ruta_actual, 'Tower'));
Minor_algorythms_path = addpath(fullfile(ruta_actual, 'Minor_algorythms'));


%Tower
initial_height = 3; 
randomness_of_the_position =3; 
randomness_of_the_mass = 3;
depth = inf;
n_AIs = 5;
computer_wins = [0 0 0 0 0];
table_of_results = zeros (5,5); 

% firs index is the n_wins of random_move (algorythm 1)
% second index is the n_wins of safety_move (algorythm 2)
% third index is the n_wins of good_moves_minimizer (algorythm 3)
% fourth index is the n_wins of minimax (algorythm 4)
% fifth index is the n_wins of combinatorial Jenga (algorythm 5)
% sixth index is the n_wins of perfect algorythm (algorythm 6)





for i = 1:n_AIs
    games_per_match = 500;
    while games_per_match >0

    for j = 1:n_AIs
        if i ~= j
% PLAYERS
computer_1 = i;
computer_2 = j;
% GAMES 
Tower = initialize_tower(initial_height,randomness_of_the_position, randomness_of_the_mass);
playing = true;
Rcm = 0;
move = 1;
Tower = check(Tower);
while playing == true
if mod(move,2) ~= 0
    player = 1;
else
    player =2;
end
Tower = check(Tower);
height = size(Tower,1); % Height of the the Tower including 0's row
%% -- COMPUTER VS COMPUTER --
% COMPUTER 1    
if player == 1 
    if computer_1 == 1
        %[computer_move,placed_piece] = random_move(Tower);
        depth = 1;
        [computer_move, placed_piece, type_of_position] = clever_minimax(Tower, depth, true);

    elseif computer_1 ==2
        %[computer_move,placed_piece] = safety_move(Tower);
        depth = 2;
                [computer_move, placed_piece, type_of_position] = clever_minimax(Tower, depth, true);
    elseif computer_1 == 3
        %[computer_move,placed_piece] = good_moves_minimizer(Tower); 
        depth = 3;
                [computer_move, placed_piece, type_of_position] = clever_minimax(Tower, depth, true);
    elseif computer_1 == 4
           % [computer_move, placed_piece, type_of_position] = clever_minimax(Tower, depth, false);
           depth = 4;
                   [computer_move, placed_piece, type_of_position] = clever_minimax(Tower, depth, true);
    elseif computer_1 == 5
         %   [computer_move, placed_piece,type_of_position] =  combinatorial_jenga (Tower);
         depth = 5;
                 [computer_move, placed_piece, type_of_position] = clever_minimax(Tower, depth, true);
    end
    % COMPUTER 2
else
    if computer_2 == 1
        %[computer_move,placed_piece] = random_move(Tower);
        depth = 1;
            [computer_move, placed_piece, type_of_position] = clever_minimax(Tower, depth, true);

    elseif computer_2 ==2
        %[computer_move,placed_piece] = safety_move(Tower);
        depth = 2;
                [computer_move, placed_piece, type_of_position] = clever_minimax(Tower, depth, true);
    elseif computer_2 == 3
        %[computer_move,placed_piece] = good_moves_minimizer(Tower); 
        depth = 3;
                [computer_move, placed_piece, type_of_position] = clever_minimax(Tower, depth, true);
    elseif computer_2 == 4
           % [computer_move, placed_piece, type_of_position] = clever_minimax(Tower, depth, false);
           depth = 4;
                   [computer_move, placed_piece, type_of_position] = clever_minimax(Tower, depth, true);
    elseif computer_2 == 5
         %   [computer_move, placed_piece,type_of_position] =  combinatorial_jenga (Tower);
         depth = 5;
                 [computer_move, placed_piece, type_of_position] = clever_minimax(Tower, depth, true);
    end
end
       row = computer_move(1);  column = computer_move(2);
    %Update the tower
    mass = Tower(row,column,1);
    Tower(row,column, 1) = 0; 
    % check if tower don't falls and plot it
    [Tower, playing] = check(Tower);
    if playing == true

        Tower = place_piece(placed_piece,Tower,mass);
        [Tower, playing] = check(Tower);
    end
    move = move+1;
end
% ADD THE RESULTS IN THE SCOREBOARD
if player == 1
    winner = 2;
    computer_wins(j) = computer_wins(j) +1;
else
    winner = 1;
    computer_wins(i) = computer_wins(i) +1;
end

if winner == 1
    table_of_results(computer_1,computer_2) = table_of_results(computer_1,computer_2)+ 1
end


        end
    end
        games_per_match = games_per_match -1;
    end
end
histogram(computer_wins)
bar(computer_wins);
xlabel('Player');
ylabel('Wins');
title('Tournament Wins');
toc

% computer_wins_perfect_game = [36 503 391 877 1346 1347];