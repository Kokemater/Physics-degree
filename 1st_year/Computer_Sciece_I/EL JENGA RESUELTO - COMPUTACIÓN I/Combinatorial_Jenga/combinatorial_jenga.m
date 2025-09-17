function [deleted_piece, placed_piece,type_of_position] =  combinatorial_jenga (Tower)
% This function given the State of the tower returns the best movement
% in the game in order to win it.
% Input: 
% Tower: (n,3,4) Hypermatrix with the position and the mass of 
% all pieces
% Output: 
% type_of_position : Indicates who is winning the game in the actual position
% it has a value of 1 if in the current Tower the first player who 
% makes a move is winning, otherwise otherwise a 2.
% deleted_piece : A pair [row, column] that indicates what piece to eliminate.
% placed piece : The position of the top layer to add the piece.
% USAGE:
% [deleted_piece, placed_piece,type_of_position] =  combinatorial_jenga (Tower)
% AUTHOR:
% Jorge Butragueño Nieto

% RESTRICTIONS!!
% This algorythm takes advantage of the symetry of jenga 
% so it cannot be implemented in games with highly random 
% masses or positions. 
% So Randomness_of_the_position and Randomness_of_the_mass must be 0.

% ALGORYTHM: 
% Jenga is a combinatorial game, so we can use
% the branch of maths of combinatorial game theory
% to calculate the best move instead of using brute force.

% If we know from advanced that in some positions a player is lost
% for example, if it is the turn of Player_1 and the tower is going to fall
% no matter the piece he moves, then he is in a so called P-position 
% since Player_2 (the previus player) wins. 
% Notice all the possible states that can lead to this situation is an 
% N-position, since the next player can move to this P-position and win the game.
% Also notice that if a player can only move to N-positions it means that he is 
% in a P position. 
% Taking everything into account, now we only need to differenciate 
% what kinds of move we can make in a game in order to create a full table of 
% N-positions and P-positions depending on the pieces that remain in the tower. 
% Once we have the table created, if we are in a N-position we only have to
% make the move that leads our opponent to a P-position. And if we are in a P-position
% we are lost so we can only wait until the opponent make a mistake.

% To differenciate the kind of position and movements we make some assumptios:
% based on repeated observations in brute force algorithms (good_moves_minimizer.m)
% note this algorythm is exponentially faster than by using brute_force.
% --- EFFICINCY IMPROVEMENTS ---

% [1] IT'S NOT NECESSARY TO STUDY THE RCM

% (1.1) This is because in a perfect Jenga Tower falls
% if and only if a layer loses a middle block and a side block so we can
% assume the tower will fall if we reach this state.


% [2] IT'S NOT NECESSARY TO STUDY ALL THE POSSIBLE MOVES
% If we distinct only 3 types of level: 
% top_level, half levels and full levels

% (2.1) Taking the same piece in different levels doesn't change the number 
% of aviable good moves if both levels are the from the same type.
% (2.2) The position of a placed piece at the top level does not affect the number of
% aviable good moves.
% (3.2)  Taking a pice of a right side of a full_level gives the same aviable
% good moves as taking from the left size

% (1) + (2) + (3) -> number of aviable good moves only depens on
% the number of: full rows, half rows, and last. 



full_levels = [];
half_levels = [];
n_top_level = 0;
% Note we don't take into account the rows with only 1 piece, or with 2
% pieces but in the sides, this is because they can never be touched.

% We represent this data in order pairs
height = calculate_height(Tower);

if Tower(height, 1,1) ~= 0 
    n_top_level = n_top_level +1;
end
if Tower(height,2,1) ~= 0 
    n_top_level = n_top_level +1;
end
if Tower(height,3,1) ~= 0 
    n_top_level = n_top_level +1;
end


for level = 1:height-1
    if Tower(level, 1,1)~= 0  && Tower(level, 2,1) ~= 0  && Tower(level, 3,1) ~= 0 
        full_levels = [full_levels level];
    end
    if (Tower(level, 1,1) ~= 0  && Tower(level, 2,1) ~= 0  && Tower(level, 3,1) == 0) ...
    || Tower(level, 1,1) == 0 && Tower(level, 2,1) ~= 0  && Tower(level, 3,1) ~= 0 
        half_levels = [half_levels level];
    end
end


n_full_levels = numel(full_levels);
n_half_levels = numel(half_levels);


% create a ordered pair. With the values: 
% n_full_levels = 3, n_top_levels = 1, n_half_valuels = 1
index_1 = 1*n_half_levels;
index_2= (n_full_levels) *3 + 1*n_top_level; 

% we add 1 to the first index to avoid zeros, note there are no problems in
% the second one since it cannot be a zero.
pair = [1+ index_1, index_2];



% From a full level: remove a side block
% This will create  -1 full_level, +1 top_level, +1 half_level.
m_full_side = [ +1,-2];

% From a full level: remove the center block
% This will create a -1 full_level, +1 top_level, +0 half_level
m_full_center = [0, -2];

% From a half_level: remove the side block
% This will create a +0 full_level, +1 top_level, -1 half_level
m_half = [-1, +1];




% build the Matrix. (this tower was calculated in place_piece)
load("Matrix.mat"); 

% -> 0 represents a P, position: (The previus player win) 
% i.e. the player who has to move is going to lose.

% -> 1 represents a N, position: (The next player win) 
% i.e. the player who has to move is going to win.

%% IF THE CURRENT STATE IS A N-POSITION
if Matrix(pair(1),pair(2)) ~= 0
    % If we are in N position we will make a move that leads to a P
    % position to our oponent.
    type_of_position = 1;
    m_f_c_move = [pair(1),pair(2)] + m_full_center;
    m_f_s_move = [pair(1),pair(2)] + m_full_side;
    m_h_move = [pair(1),pair(2)] + m_half;
    
    
    if (m_f_c_move(1) > 0 && m_f_c_move(2) > 0) && ...
       (numel(full_levels) > 0) && ...
        Matrix(m_f_c_move(1), m_f_c_move(2)) == 0
        % from full_rows, take a central piece

            random_index = randi([1, numel(full_levels)]); % random level
            deleted_piece = [full_levels(random_index), 2];
                    

    elseif (m_f_s_move(1) > 0 && m_f_s_move(2) > 0) && ...
        (numel(full_levels) > 0) && ...
        Matrix(m_f_s_move(1), m_f_s_move(2)) == 0
        % from full_rows, take a side piece

        % random column:
        choice = randi([1,2]);
        if choice == 1
            chosen_column = 1;
        else
            chosen_column = 3;
        end
           random_index = randi([1, numel(full_levels)]); %random level
           deleted_piece = [full_levels(random_index) chosen_column];

    else 
        % from half_rows, take a side_piece
        random_index = randi([1, numel(half_levels)]); %random level
        
        if Tower(half_levels(random_index),1,1) ~= 0 
            chosen_column = 1;
        else
            chosen_column = 3;
        end
        deleted_piece = [half_levels(random_index),chosen_column ];
            
    end


%% IF THE CURRENT STATE IS A P-POSITION
else
    type_of_position = 0;
    % we are lost so all possible moves are equally good or bad, we only
    % can hope our opponent is going to commit a mistake. The best option
    % is try to maximize as long as possible the duration of the game.
    
% If possible take a side piece from a full_level to maximize the duration
% of the game
    if numel(full_levels) >0
        choice = randi([1,2]);
        if choice == 1
            chosen_column = 1;
        else
            chosen_column = 3;
        end
           random_index = randi([1, numel(full_levels)]); %random level
           deleted_piece = [full_levels(random_index) chosen_column];
    elseif numel(half_levels) > 0
        % from half_rows, take a side_piece
        random_index = randi([1, numel(half_levels)]); %random level
        
        if Tower(half_levels(random_index),1,1) ~= 0 
            chosen_column = 1;
        else
            chosen_column = 3;
        end
        deleted_piece = [half_levels(random_index),chosen_column];

    else
        % I am lost, any movement makes the tower falls
        [row, col] = find(Tower(1:height-1,:,1) ~= 0 ,1);
        deleted_piece= [row, col];
        
    end

end

% Since the position in the top does not really matter it will be totally
% random.
               
free_squares = find(Tower(height,:,1) ==0);
if numel(free_squares)== 0
    placed_piece = randi([1,3]); % Start a new level
else
    rand_index = randi(numel(free_squares));
    placed_piece = free_squares(rand_index);
end


end

