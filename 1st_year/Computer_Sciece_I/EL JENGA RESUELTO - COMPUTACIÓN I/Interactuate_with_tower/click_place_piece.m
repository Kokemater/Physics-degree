function [position, haux] = click_place_piece(Tower)
% This function will detect the mouse click on the tower and will allow us 
% to interact with it without having to put the data directly into the code.
% This function will be used to see in which of the three positions of the 
% new zero level the piece can be placed.
% INPUT:
% Tower : Tower to click on
% OUTPUT:
% position : Column in which you want to place
% haux : New level of zeros where to place the piece (height)
% USAGE:
% [position, haux] = click_place_piece(Tower)
% AUTHOR:
% Lucía García Echávarri

% Update the height of the tower
height = size(Tower,1); 
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

    
    % The coordinates of the click are transformed into the coordinates of
    % where add the piece
    [xaux, yaux, zaux] = mesh(point(1,1), point(1,2), point(1,3), Tower);
    coordx = [xaux, yaux, zaux];
    [haux, position] = coord_to_piece(xaux, yaux, zaux, Tower);
        
        % If you select a level other than the top of the tower
        if haux ~= height
            disp('You must select a gap in the last row')
        
        % If you select a space where there is already a piece
        elseif Tower(height, position, 1) == 1
            disp('There is already a piece there')
        else 
            break;
        end
           

end
end