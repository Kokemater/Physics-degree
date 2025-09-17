function [vertex] = piece(center, orientation, display_the_piece ,color)
% This function plots a jenga piece according the postion and the
% parameters, also it returns the vertex
% Input:
% Center : [ x, y, z] position of the center of the piece
% Orientation : 1 or 2 depending on the level of the piece
% display_the_piece : true if you want to show it, false otherwise.
% color : color the piece according to the mass (1-4)
% Output :
% vertex : return all the vertex
% Usage : 
% [vertex] = pieza(center, orientation, display_the_piece ,color)
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

    % Rectangular prism dimensions
    length = 7.5; width = 2.5;  height = 1.5;

    % Calculate the coordinates of the corners of the prism
    x = center(1);
    y = center(2);
    z = center(3);
if orientation == 1

    % Prism vertices with orientation 1 (straight block)
    vertex = [x - length/2, y - width/2, z - height/2;     % Corner 1 (bottom-left-posterior)
                x - length/2, y - width/2, z + height/2;   % Corner 2 (bottom-left-anterior)
                
                x - length/2, y + width/2, z + height/2;   % Corner 3 (bottom-right-anterior)
                x - length/2, y + width/2, z - height/2;   % Corner 4 (bottom-right-posterior)
   
                x + length/2, y - width/2, z - height/2;   % Corner 5 (top-left-posterior)
                x + length/2, y - width/2, z + height/2;   % Corner 6 (top-left-anterior)

                x + length/2, y + width/2, z + height/2;   % Corner 7 (top-right-anterior)
                x + length/2, y + width/2, z - height/2;   % Corner 8 (top-right-posterior)
               ]; 
else 
    % Prism vertices with orientation 2 (twisted block)
        vertex = [x - width/2, y - length/2, z - height/2;  % Corner 1 (bottom-left-posterior)
                x - width/2, y - length/2, z + height/2;   % Corner 2 (bottom-left-anterior)
                
                x - width/2, y + length/2, z + height/2;   % Corner 3 (bottom-right-anterior)
                x - width/2, y + length/2, z - height/2;   % Corner 4 (bottom-right-posterior)
   
                x + width/2, y - length/2, z - height/2;   % Corner 5 (top-left-posterior)
                x + width/2, y - length/2, z + height/2;   % Corner 6 (top-left-anterior)

                x + width/2, y + length/2, z + height/2;   % Corner 7 (top-right-anterior)
                x + width/2, y + length/2, z - height/2;   % Corner 8 (top-right-posterior)
               ]; 
end

if color ==1
    color = [187, 255, 255]/255; 
elseif color == 2
    color = [95, 188, 188 ]/255; 
elseif color ==3
    color = [55, 138, 138 ]/255;
elseif color ==4
    color = [2, 96, 96 ]/255;
else
    color = [1,1,1];
end


if display_the_piece >0
    % Draw prism if specified
    axis equal
    axis off
    hold on
    % Draw the faces of the prism
    patch([vertex(1,1),vertex(2,1),vertex(3,1),vertex(4,1)],[vertex(1,2),vertex(2,2),vertex(3,2),vertex(4,2)], [vertex(1,3),vertex(2,3),vertex(3,3),vertex(4,3)], color)
    patch([vertex(5,1),vertex(6,1),vertex(7,1),vertex(8,1)],[vertex(5,2),vertex(6,2),vertex(7,2),vertex(8,2)], [vertex(5,3),vertex(6,3),vertex(7,3),vertex(8,3)], color)
    patch([vertex(1,1),vertex(2,1),vertex(6,1),vertex(5,1)],[vertex(1,2),vertex(2,2),vertex(6,2),vertex(5,2)], [vertex(1,3),vertex(2,3),vertex(6,3),vertex(5,3)], color)
    patch([vertex(3,1),vertex(4,1),vertex(8,1),vertex(7,1)],[vertex(3,2),vertex(4,2),vertex(8,2),vertex(7,2)], [vertex(3,3),vertex(4,3),vertex(8,3),vertex(7,3)], color)
    patch([vertex(2,1),vertex(3,1),vertex(7,1),vertex(6,1)],[vertex(2,2),vertex(3,2),vertex(7,2),vertex(6,2)], [vertex(2,3),vertex(3,3),vertex(7,3),vertex(6,3)], color)
    patch([vertex(1,1),vertex(4,1),vertex(8,1),vertex(5,1)],[vertex(1,2),vertex(4,2),vertex(8,2),vertex(5,2)], [vertex(1,3),vertex(4,3),vertex(8,3),vertex(5,3)], color)
    hold off
    alpha(display_the_piece);
elseif display_the_piece < 0
    
    patch([vertex(1,1),vertex(2,1),vertex(3,1),vertex(4,1)],[vertex(1,2),vertex(2,2),vertex(3,2),vertex(4,2)], [vertex(1,3),vertex(2,3),vertex(3,3),vertex(4,3)], 'r', 'EdgeColor', 'b', 'FaceColor', 'none', 'LineWidth', 2)
    patch([vertex(5,1),vertex(6,1),vertex(7,1),vertex(8,1)],[vertex(5,2),vertex(6,2),vertex(7,2),vertex(8,2)], [vertex(5,3),vertex(6,3),vertex(7,3),vertex(8,3)], 'r', 'EdgeColor', 'b', 'FaceColor', 'none', 'LineWidth', 2)
    patch([vertex(1,1),vertex(2,1),vertex(6,1),vertex(5,1)],[vertex(1,2),vertex(2,2),vertex(6,2),vertex(5,2)], [vertex(1,3),vertex(2,3),vertex(6,3),vertex(5,3)], 'r', 'EdgeColor', 'b', 'FaceColor', 'none', 'LineWidth', 2)
    patch([vertex(3,1),vertex(4,1),vertex(8,1),vertex(7,1)],[vertex(3,2),vertex(4,2),vertex(8,2),vertex(7,2)], [vertex(3,3),vertex(4,3),vertex(8,3),vertex(7,3)], 'r', 'EdgeColor', 'b', 'FaceColor', 'none', 'LineWidth', 2)
    patch([vertex(2,1),vertex(3,1),vertex(7,1),vertex(6,1)],[vertex(2,2),vertex(3,2),vertex(7,2),vertex(6,2)], [vertex(2,3),vertex(3,3),vertex(7,3),vertex(6,3)], 'r', 'EdgeColor', 'b', 'FaceColor', 'none', 'LineWidth', 2)
    patch([vertex(1,1),vertex(4,1),vertex(8,1),vertex(5,1)],[vertex(1,2),vertex(4,2),vertex(8,2),vertex(5,2)], [vertex(1,3),vertex(4,3),vertex(8,3),vertex(5,3)], 'r', 'EdgeColor', 'b', 'FaceColor', 'none', 'LineWidth', 2)
    hold off
end
end