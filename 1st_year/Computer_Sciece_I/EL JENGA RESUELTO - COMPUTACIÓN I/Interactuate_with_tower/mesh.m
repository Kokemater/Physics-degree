function [x_piece, y_piece, z_piece] = mesh(x_click, y_click, z_click, Tower)
% This function will establish two meshes, one in the xz plane and the other 
% in the yz plane in order to detect the point clicked and be able to determine 
% the piece that has been chosen.
% INPUT:
% x_click : x coordinate of the point when you click with the mouse.
% y_click : y coordinate of the point when you click with the mouse.
% z_click : z coordinate of the point when you click with the mouse.
% Tower 
% OUTPUT:
% x_piece : x coordinate of the piece.
% y_piece : y coordinate of the piece.
% z_piece : z coordinate of the piece.
% USAGE:
% [x_piece, y_piece, z_piece] = mallas(x_click, y_click, z_click, Tower)
% AUTHOR:
% Lucía García Echávarri


% First, a distance is established at infinity so that later all the distances 
% that come out are always less than the predefined one.
    min_distance = inf;

    for i = 1:length(Tower(:,1,1))
        for j = 1:length(Tower(1,:,1))
            
            % Tower's coordinate z
            z_piece_current = Tower(i, j, 4); 

            % Distance between the two coordinates
            distance = abs(z_piece_current - z_click); 
            
            % The new z_piece is set
            if distance < min_distance
                min_distance = distance;
                z_piece = z_piece_current;
            end
        end
    end

    % We look for the row ( with the heights )
    [row_, a] = find(Tower(:,1,4) == z_piece);
    
    if x_click == max(Tower(:,2,2))+3.75 % first we detect if the click is on the right side
        if mod(row_,2) == 0 % even pieces

            if y_click < -1.25+Tower(row_,2,3)
                x_piece = Tower(row_,1,2);
                y_piece = Tower(row_,1,3);

            elseif y_click > 1.25+Tower(row_,2,3)
                x_piece = Tower(row_,3,2);
                y_piece = Tower(row_,3,3);
            else
                x_piece = Tower(row_,2,2);
                y_piece = Tower(row_,2,3);
            end

        else % odd pieces
            x_piece = Tower(row_,3,2);
            y_piece = Tower(row_,3,3);
        end



    else % if not it will be on the left side

        if mod(row_,2) == 0 % even pieces
            x_piece = Tower(row_,1,2);
            y_piece = Tower(row_,1,3);

        else % odd pieces
            if x_click < -1.25+Tower(row_,2,2)
                x_piece = Tower(row_,1,2);
                y_piece = Tower(row_,1,3);

            elseif x_click > 1.25+Tower(row_,2,2)
                x_piece = Tower(row_,3,2);
                y_piece = Tower(row_,3,3);
            else
                x_piece = Tower(row_,2,2);
                y_piece = Tower(row_,2,3);
            end
        end
    end

end