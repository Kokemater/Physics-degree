function animation_remove(Tower, row, column, Rcm, move, animate)
% This function represents the animation of a piece that is coming out of the tower 
% after detect the click in a piece.
% INPUT:
% Tower : tower where represent the animation
% row : clicked level where to remove the piece
% Rcm : (1,3) array with the [x,y,z] position of the center of mass.
% move : int data with the number of moves of the game
% animate : true
% OUTPUT:
% Does not return any variable, performs an animation
% USAGE:
% animation_remove(Tower, row, column, Rcm, move, animate)
% AUTHOR:
% Lucía García Echávarri


if animate == true
    vel = 5;

    for k = 1:vel
        if mod(row,2) == 0
            Tower(row, column, 2) = Tower(row, column, 2) + 8/vel;
        else
            Tower(row, column, 3) = Tower(row, column, 3) - 8/vel;
        end
        xlim([-3.75 12.75])
        ylim([-12.75 3.75])
        build_the_tower2(Tower,true,Rcm,move,false)
        pause(0.00000001)
    end

end