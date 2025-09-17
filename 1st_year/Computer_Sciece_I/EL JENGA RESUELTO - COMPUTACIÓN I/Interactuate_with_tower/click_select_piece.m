function [row, column] = click_select_piece(Tower)       
% This function will detect the mouse click on the tower and will allow us 
% to interact with it without having to put the data directly into the code.
% This function will be used to determine the piece that you want to remove.
% INPUT:
% Tower : Tower to interactuate
% OUTPUT:
% row : row of the select piece
% column : column of the select piece
% USAGE:
% [row, column] = click_select_piece(Tower) 
% AUTHOR:
% Lucía García Echávarri


% First we see the height of the tower we are in, to know all the pieces we
% can take out
height_ = calculate_height(Tower); % Height that doesn't count the 0 zero's row
while true
    
    % We establish the limits within the tower starting from the central 
    % piece on each axis
    xlim([min(Tower(:,2,2))-3.75 max(Tower(:,2,2))+3.75]) 
    ylim([min(Tower(:,2,3))-3.75 max(Tower(:,2,3))+3.75])

    % With these functions, matlab allows interaction with the program 
    % through the mouse.
            
    % Pauses the execution of a program until the user presses a mouse button or keyboard key
    waitforbuttonpress; 

    % Returns the current coordinates of the mouse cursor in units of the current axes
    point = get(gca, 'CurrentPoint'); 
    
    
    % The coordinates of the click are transformed into the coordinates of the piece
    [xaux, yaux, zaux] = mesh(point(1,1), point(1,2), point(1,3), Tower);
    coordx = [xaux, yaux, zaux];
    [row, column] = coord_to_piece(xaux, yaux, zaux, Tower);

        % If you click on the highest level you cannot take pieces from there 
        % (those are the rules)
        if row == height_
            disp('You can not take a piece of the last row')
        
        % You cannot click on a site where there is no longer a piece
        elseif Tower(row, column, 1) == 0
            disp('There is no piece there')
        else
            break;
        end
            
      
end
end