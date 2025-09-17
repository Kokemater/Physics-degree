function animation_add(Tower, row, column, Rcm, move, animate)
% This function represents the animation of a piece being placed back 
% on the tower after detect the click in the last row of zeros.
% INPUT:
% Tower : tower where represent the animation
% row : clicked level where to add the piece
% Rcm : (1,3) array with the [x,y,z] position of the center of mass.
% move : int data with the number of moves of the game
% animate : true
% OUTPUT:
% Does not return any variable, performs an animation
% USAGE:
% animation_add(Tower, row, column, Rcm, move, animate)
% AUTHOR:
% Lucía García Echávarri

if animate == true
    vel = 5;
    hmax = Tower(row, column, 4);

    for k = 1:vel

        Tower(row, column, 4) = (hmax + 8) - k*(8/vel);

        build_the_tower2(Tower,true,Rcm,move,false)
        pause(0.0000000001)
    end
end
