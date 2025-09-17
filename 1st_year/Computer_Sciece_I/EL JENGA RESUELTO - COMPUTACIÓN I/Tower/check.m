function [Tower, playing]  = check(Tower,move, show_top_options,analyze)
% This function controls the plot parameters of the tower 
% check if tower still does not fall and control the plots of the tower.
% INPUT:
% Tower : Tower: (n,3,4) Hypermatrix with the mass and the position of 
% all pieces.
% move : int data with the number of moves of the game
% analyze : bool data, if analyze == true then all the information of the
% game will be shown as well as the analysis by computer of the moves.
% OUTPUT:
% Tower : Updated tower
% playing : game status
% USAGE:
% check(Tower,move, show_top_options,analyze)
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri

height  = size(Tower,1);
if Tower(height,1,1) ~= 0 && Tower(height,2,1) ~= 0 && Tower(height,3,1) ~=0
    Tower = add_new_level(Tower);
end
% Check the stability

        [stability, Rcm] = is_stable(Tower);
 
        if  stability== 1 
            playing = true;

        else
            playing = false;
            show_top_options = false;

            % End the game
        end

if nargin ==1 
    return % Plot nothing.
elseif nargin ==4
    build_the_tower(Tower,playing,Rcm,move,show_top_options,analyze);
    return % Plot the tower in analysis mode
else
    build_the_tower(Tower,playing, Rcm, move, show_top_options);
    return % Plot the tower in game mode
end