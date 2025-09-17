% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

clear all
clc
clf
close all

% ADD PATHS
ruta_actual = fileparts(which("Jenga.m"));
Minimax_path = addpath(fullfile(ruta_actual, 'Minimax'));
Tools_path = addpath(fullfile(ruta_actual, 'Tools'));
Combinatorial_jenga_path = addpath(fullfile(ruta_actual, 'Combinatorial_Jenga'));
is_stable_path = addpath(fullfile(ruta_actual, 'is_stable'));
Tower_path = addpath(fullfile(ruta_actual, 'Tower'));
Animations_path = addpath(fullfile(ruta_actual, 'Animations'));
Interactuate_with_tower_path = addpath(fullfile(ruta_actual, 'Interactuate_with_tower'));
Minor_algorythms_path = addpath(fullfile(ruta_actual, 'Minor_algorythms'));
Analysis_path = addpath(fullfile(ruta_actual, 'Analysis'));

figure1 = figure();
set(figure1, 'Menubar', 'none')

%START THE GAME
playing = true;

 
% ----------PARAMETERS WE CAN CHANGE-------------------

% ---- TOWER -----
% Height of our tower (1-n), typically Jenga is played on a 18x3 board.
initial_height = 12; 
%Randomness of the position of the pieces
% 0(perfectly ordered) - 3 (It's possible to add more but the tower may initially falls)
randomness_of_the_position = 0; 
%Randomness of the position of the pieces
% 0(every piece weighs the same: 1kg)-3(different (1g, 2kg, 3kg, 4kg))
randomness_of_the_mass = 3;


% ----- GAME ------
% Game mode:
% (1) Two players, adding pieces until someone lost
% (2) Play against computer
% (3) Computer Vs Computer
game_mode = 1;
% Change this if you don't wanna see the animations
animate = true; 



% ----ALGORYTHMS ------
% In game_mode 2 we can select the level of the computer 
% (higher levels use better algorythms)
if game_mode == 2
    computer_level = 6; 
end

% In game_mode 3 we can select the level of both computers to prove
% better algorithms have more chances to win.
% (higher levels use better algorythms)
if game_mode ==3
    computer_level_1 =6;
    computer_level_2 =6;
end

depth = 1;

% -----------------------------------
% Initialize variables

scoresheet = []; % Save the movements
computer_analysis = true; % Study the game with the best algorythm
move = 1; % played turns


% Build the tower with the initial parameters
Initial_tower = initialize_tower(initial_height,randomness_of_the_position, randomness_of_the_mass);
Initial_tower = add_new_level(Initial_tower);
Tower = Initial_tower;

Rcm = 0;
time_paused = 0.0001; % change this to increase or decrease the stop time

% LOOP UNTIL THE GAME IS OVER
while playing == true

player = turn(move);

% show the tower
Tower = check(Tower,move, false);

height = size(Tower,1); % Height of the the Tower including 0's row
height_ = calculate_height(Tower); % Height that doesn't count the zero's row


%% -- HUMAN VS HUMAN --

if game_mode == 1 
    
    % If we play in 1 vs 1 mode
        % Select deleted piece:
        [row, column] = click_select_piece(Tower); 
        
        % Animation
        animation_remove(Tower, row, column, Rcm, move, animate);

        mass = Tower(row,column,1);
        Tower(row,column, 1) = 0; 
        % check if Tower don't falls
        [Tower, playing] = check(Tower,move, true); 

    if playing == true
        % Select placed position:
        [placed_piece, haux] = click_place_piece(Tower);

        % Animation
        Tower = place_piece(placed_piece,Tower,mass);
        animation_add(Tower, haux, placed_piece, Rcm, move, animate);

        % check if Tower don't falls
        [Tower, playing] = check(Tower,move, false);
    end

elseif game_mode ==2
    %% -- HUMAN VS COMPUTER --
    % Determines the turn
    if player == 1
        % HUMAN MOVES
        [row, column] = click_select_piece(Tower);
        % Animation
        animation_remove(Tower, row, column, Rcm, move, animate);

        mass = Tower(row,column,1);
        Tower(row,column, 1) = 0; 
        [Tower, playing] = check(Tower,move,true); % check if Tower don't falls  
    if playing == true
        [placed_piece, haux] = click_place_piece(Tower);
        animation_add(Tower, haux, placed_piece, Rcm, move,animate);

        Tower = place_piece(placed_piece,Tower,mass);
        animation_add(Tower, haux, placed_piece, Rcm, move,animate);
        [Tower, playing] = check(Tower,move,false);
    end
    else 
        % COMPUTER MOVES

    % choose the move acording to the algorythm we have selected
    if computer_level == 1
        [computer_move,placed_piece] = random_move(Tower);
    elseif computer_level ==2
        [computer_move,placed_piece] = safety_move(Tower);
    elseif computer_level == 3
        [computer_move,placed_piece] = good_moves_minimizer(Tower); 
    elseif computer_level == 4
            [computer_move, placed_piece, type_of_position] = clever_minimax(Tower, depth, false);
    elseif computer_level == 5
            [computer_move, placed_piece,type_of_position] =  combinatorial_jenga (Tower);
    elseif computer_level == 6
            [computer_move, placed_piece, type_of_position] = perfect_algorythm(Tower, randomness_of_the_position, randomness_of_the_mass, player);
    end
       row = computer_move(1);  column = computer_move(2);
       animation_remove(Tower, row, column, Rcm, move,animate);


    %Update the tower
    mass = Tower(row,column,1);
    Tower(row,column, 1) = 0; 
    % check if tower don't falls and plot it
    [Tower, playing] = check(Tower,move,false);
    if playing == true
        Tower = place_piece(placed_piece,Tower,mass);
        animation_add(Tower, height, placed_piece, Rcm, move,animate);
        [Tower, playing] = check(Tower,move,false);
        
    end
    end

else
    %% -- COMPUTER VS COMPUTER --
    % COMPUTER 1
    if player == 1 
        if computer_level_1 == 1
            [computer_move,placed_piece] = random_move(Tower);
        elseif computer_level_1 ==2
            [computer_move,placed_piece] = safety_move(Tower);
        elseif computer_level_1 == 3
            [computer_move,placed_piece] = good_moves_minimizer(Tower); 
        elseif computer_level_1 == 4
            [computer_move, placed_piece, type_of_position] = clever_minimax(Tower, depth, true);
        elseif computer_level_1 == 5
            [computer_move, placed_piece,type_of_position] =  combinatorial_jenga (Tower);
        elseif computer_level_1 == 6
            [computer_move, placed_piece, type_of_position] = perfect_algorythm(Tower, randomness_of_the_position, randomness_of_the_mass, player);
        end
    % COMPUTER 2
    else
        if computer_level_2 == 1
            [computer_move,placed_piece] = random_move(Tower);
        elseif computer_level_2 ==2
            [computer_move,placed_piece] = safety_move(Tower);
        elseif computer_level_2 == 3
            [computer_move,placed_piece] = good_moves_minimizer(Tower); 
        elseif computer_level_2 == 4
            [computer_move, placed_piece, type_of_position] = clever_minimax(Tower, depth, true);
        elseif computer_level_2 == 5
            [computer_move, placed_piece,type_of_position] =  combinatorial_jenga (Tower);
        elseif computer_level_2 == 6
            [computer_move, placed_piece, type_of_position] = perfect_algorythm(Tower, randomness_of_the_position, randomness_of_the_mass, player);
        end
    end
       
       row = computer_move(1);  column = computer_move(2);
       animation_remove(Tower, row, column, Rcm, move,animate);

    %Update the tower
    mass = Tower(row,column,1);
    Tower(row,column, 1) = 0; 
    % check if tower don't falls and plot it
    [Tower, playing] = check(Tower,move,false);
    pause(time_paused)
    if playing == true
        Tower = place_piece(placed_piece,Tower,mass);
        animation_add(Tower, row, column, Rcm, move, animate);
        [Tower, playing] = check(Tower,move,false);
    end

end

scoresheet = [scoresheet; [ move row, column, placed_piece]];
move = move +1;
pause(time_paused)

end

%% ANALYZE THE GAME
pause(1)


fprintf("lets analyze \n ")


% Do you want to analyze the match
if computer_analysis == true
    analyze(scoresheet,Initial_tower)
end
