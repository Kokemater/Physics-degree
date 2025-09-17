function new_list = delete_elements_from_list(list)
% This funcion deletes the zero elements in the list
% INPUT:
% list : pieces of the tower
% OUTPUT: 
% new_list : list that stores the non-zero elements of the original list.
% USAGE:
% new_list = delete_elements_from_list(list)
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

    new_list = [];
    
    % Iterate over each row in the list
    for i = 1:size(list, 1)
        % Check if the x, y and z elements of the row are all 0
        if ~all(list(i, 3:end) == 0)
            new_list = [new_list; list(i, :)];
        end
    end

end