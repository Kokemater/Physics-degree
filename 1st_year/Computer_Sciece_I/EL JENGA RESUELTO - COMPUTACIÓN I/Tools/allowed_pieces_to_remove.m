function allowed = allowed_pieces_to_remove (Tower) 
% This function gives the possible pieces you can remove in a list
% Input: 
% Tower: (n,3,4) Hypermatrix with the position and the mass of 
% all pieces
% Output: 
% allowed : list with [row column] pair of the possible pieces we can
% remove
% Usage
% allowed = allowed_pieces_to_remove (Tower) 
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

height = calculate_height(Tower);
allowed = [];

for i = 1:height-1
    for j = 1:3
        if Tower(i, j) ~= 0
            p = size(allowed, 1) + 1;
            allowed(p, :) = [i, j];
        end
    end
end

end