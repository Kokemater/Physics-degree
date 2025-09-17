function [deleted_piece, placed_piece , allowed] = safety_move(Tower)
% This function will select a move for the tower provided that
% the Tower won't fall unless there are no option. 
% In that case it will chose a random move
% Input: 
% Tower: (n,3,4) Hypermatrix with the position and the mass of 
% all pieces
% Output: 
% deleted_piece : A pair [row, column] that indicates what piece to eliminate.
% placed piece : The position of the top layer to add the piece.
% Usage : 
% [deleted_piece, placed_piece] = random_move(Tower)
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

% ALGORYTHM 
% This program firslty will select all the aviable pieces to delete , 
% secondly it will simulate what would happen to the tower if we take off a piece
% for every of them by using is_stable.m and if case the tower does not
% falls also it will simulate what will happen to the tower in case we
% place it at every position.
% Thirdly it will chose randomly what piece to remove between them
% and after that it will simulate again what would happen if we place the piece
% in all the possible top positions, if we find a good one, then place there. 
% Otherwise, repeat with another movement.
% In case there are no good movements then choose randomly since tower is always going fall.
height = size(Tower,1);
p =1;
% Initialize variables
hypothetical_tower = Tower; % We will work on a copy of the Tower
allowed_and_good_deleted_piece = [0 0]; % row and colum of the deleted piece
allowed_and_good_top_position = [0 0 0]; % good added columns
ignore = [];
top = size(hypothetical_tower,1);

% Create an array of all the possible moves
allowed_deleted_piece = allowed_pieces_to_remove(Tower);

% Possible positions at the top
allowed_top_position = free_squares_at_the_top(Tower); 

% Itereate on each move to check if the Tower would fall
n_allowed_deleted_piece = size(allowed_deleted_piece,1);




for del_p = 1:n_allowed_deleted_piece
    mass = hypothetical_tower(allowed_deleted_piece(del_p,1),allowed_deleted_piece(del_p,2),1);
    hypothetical_tower(allowed_deleted_piece(del_p,1),allowed_deleted_piece(del_p,2),1) = 0;
    stability = is_stable(hypothetical_tower);
    
    % Now we simulate where can we put the piece 

    if stability == 1
        % save that we can remove this piece and the Tower won't fall
        allowed_and_good_deleted_piece(p, :) = [allowed_deleted_piece(del_p,1), allowed_deleted_piece(del_p,2)];
        allowed_and_good_top_position(p,:) = [0 0 0];
        for i = 1: numel(allowed_top_position)
            hypothetical_tower(top , allowed_top_position(i),1) = mass;
            stability = is_stable(hypothetical_tower);
            if stability ==true
                allowed_and_good_top_position(p,i) = allowed_top_position(i);
            end
            hypothetical_tower(top, allowed_top_position(i),1) = 0; % prepare for next loop         
        end
%{
         if allowed_and_good_top_position(p,:) == [0 0 0] % in case there is no good option
            ignore = [ignore ; p]; 
         end
%}
         p = p+1;
    end
    hypothetical_tower(allowed_deleted_piece(del_p,1),allowed_deleted_piece(del_p,2),1) = mass; % rebuild the hole

end

% correct the list to remove the movements that let you remove the piece,
% but after that you have no good movement.

%allowed_and_good_top_position = delete_elements_from_list(allowed_and_good_top_position);
%allowed_and_good_deleted_piece =  delete_elements_from_list(allowed_and_good_deleted_piece);



if allowed_and_good_deleted_piece == [0 0] % if there is no aviable movement
    deleted_index = randi(size(allowed_deleted_piece, 1));
    deleted_piece = allowed_deleted_piece(deleted_index, :);
    placed_piece = allowed_and_good_deleted_piece(1);
else
    deleted_index = randi(size(allowed_and_good_deleted_piece, 1));
    deleted_piece = allowed_and_good_deleted_piece(deleted_index, :);
    % Now add the index of the added piece
    i= find(allowed_and_good_top_position(deleted_index,:) ~= 0,1);
    placed_piece = allowed_and_good_top_position(deleted_index, i);

end

allowed = [allowed_and_good_deleted_piece allowed_and_good_top_position];

end