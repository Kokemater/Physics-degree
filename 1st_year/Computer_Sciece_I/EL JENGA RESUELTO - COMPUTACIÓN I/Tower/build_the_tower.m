function build_the_tower(Tower,playing, Rcm, move, show_top_options,analyze)
% This function given the current state of the tower plot it 
% and depending on some parameters the plot will indicate information 
% about the game. 
% Input:
% Tower: (n,3,4) Hypermatrix with the mass and the position of 
% all pieces.
% playing : bool data. If Tower still does not fall then playing = true,
% false, otherwise.
% Rcm : (1,3) array with the [x,y,z] position of the center of mass.
% move : int data with the number of moves of the game
% analyze : bool data, if analyze == true then all the information of the
% game will be shown as well as the analysis by computer of the moves.
%Output: 
% None, the function justs plot the tower.
% Usage: 
% build_the_tower(Tower,playing, Rcm, move, analyze)
% AUTHORS:
% Jorge Butragueño Nieto
% Lucía García Echávarri


height = size(Tower,1);

if mod(move,2) ~= 0 
    player = 1;
else
    player = 2;
end





%% BUILD THE TOWER
clf
for i = 1:height
        for j = 1:3
            %Set parameters (color(mass) , and position)
           color = Tower(i,j,1); x = Tower(i,j,2); y = Tower(i,j,3); z= Tower(i,j,4);
           orientacion = orientation(i); 
           % this will draw or not the pieces
           if (Tower(i,j,1) ~= 0)
               dibujar =1; % draw with full opacity
           else
               dibujar =0; % draw nothing
           end
           if playing == false
               dibujar =0.75; % add transparency (75% of opacity)
           end
        if i == height && (Tower(i,j,1) == 0) && show_top_options == true
            dibujar = -1;
        end
           piece([x,y,z],orientacion,dibujar,color);
           hold on
        end
end



%% ADD PLOT LOGIC DEPENDING ON PLAYING AND ANALYSIS
if nargin <6 % If not in analysis mode
% Format the string
titleText = sprintf('Player: %d, Move: %d', player, move);
set(gcf, 'Color', [1 1 1])

else % If analyzing
is_a_good_move = analyze(1);
type_of_position = analyze(2);


     % Indicates if the move is good or bad
     if is_a_good_move == 0
         titleText = sprintf('(=) OK ');
         set(gcf, 'Color', [0.74117 0.8039215 0.8156862])

     elseif is_a_good_move == 1
         titleText = sprintf('(!) Good Move ');
         set(gcf, 'Color', "green")

     elseif is_a_good_move == -1 || is_a_good_move == -2
         titleText = sprintf('(?) Error ');
         set(gcf, 'Color', "red")

     end
     % Indicates the player that is winning in the current position
     if type_of_position == 0
         winner = player;
     else
         if player == 1
             winner=2;
         else
             winner=1;
         end
     end
     if playing == true
     annotation_text = sprintf("PLAYER %d IS WINNING %d", winner);
     annotation('textbox', [0.7, 0.9, 0.3, 0.1], 'String', annotation_text)
     end
end



if playing == false

     scatter3(Rcm(1),Rcm(2),Rcm(3), 100, 'filled',"red")
     x = [Rcm(1) Rcm(1)]; % x-coordinates (both points have the same x)
     y = [Rcm(2) Rcm(2)]; % y-coordinates (both points have the same y)
     z = [0 height*1.5]; % z-coordinates (start at z=0 and end at z=n)
     plot3(x, y, z, 'r', 'LineWidth', 3)
     if nargin < 6
        set(gcf, 'Color', "yellow")
     end

    % Format the string
    %the other player wins:
    if player ==1
        winner=2;
    else
        winner=1;
    end
    titleText = sprintf('Player: %d Wins!!', winner);
    % Set the title for playing
    title(titleText);

     grid on

else

% Set the title for playing
title(titleText);


end


zoom_out_factor = 5;

view(46,31)



set(gca,"fontsize",13)    
axis off



hold off
% Plot the line

end