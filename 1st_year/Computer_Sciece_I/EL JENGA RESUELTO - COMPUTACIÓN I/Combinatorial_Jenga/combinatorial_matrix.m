% This program creates the table matrix.mat that specifies the type of
% position (P-position or N-position) depending on the current
% configuration of the tower
% AUTHOR:
% Jorge Butragueño Nieto

% From a full level: remove a side block
% This will create  -1 full_level, +1 top_level, +1 half_level.
m_full_side = [ +1,-2];

% From a full level: remove the center block
% This will create a -1 full_level, +1 top_level, +0 half_level
m_full_center = [0, -2];

% From a half_level: remove the side block
% This will create a +0 full_level, +1 top_level, -1 half_level
m_half = [-1, +1];



Matrix = ones (300,300)*2;


n = 0;
while n <100
% Set the obvious P_position
Matrix(1,1) = 0; Matrix(1,2) = 0; Matrix(1,3) = 0;
[row_0, column_0] = find(Matrix==0); % find P positions

% If you can move to a P position then you are in an N position
for p = 1:numel(row_0)

% movement from an unexplored square to a zero square
i = row_0(p);
j = column_0(p);
m_f_c_move = [i,j] - m_full_center;
m_f_s_move = [i,j] - m_full_side;
m_h_move = [i,j] - m_half;

% If you can move to a 0, this position is a 1
if Matrix(i,j) == 0 
    if (m_f_c_move(1) >0 && m_f_c_move(2) >3) &&...
      (Matrix(m_f_c_move(1), m_f_c_move(2))) == 2
        Matrix(m_f_c_move(1), m_f_c_move(2)) = 1;
    end
    if (m_f_s_move(1) >0 && m_f_s_move(2) >3) && ...
      (Matrix(m_f_s_move(1), m_f_s_move(2))) == 2
        Matrix(m_f_s_move(1), m_f_s_move(2)) = 1;
    end
    if (m_h_move(1) >1 && m_h_move(2) >0) && ...
      (Matrix(m_h_move(1), m_h_move(2))) == 2
        Matrix(m_h_move(1), m_h_move(2)) = 1;
    end

end

end




[row_1, column_1] = find(Matrix==1); % find N-position

% If all your possible moves connect to an N-position then you are 
% in a P position.

% We study the possible P position
possible_P = [];
for index =1:numel(row_1)
if column_1(index) > 3
    possible_P = [possible_P ; [row_1(index), column_1(index)] - m_full_center] ;
    possible_P = [possible_P ; [row_1(index), column_1(index)] - m_full_side ] ;

end
    possible_P = [possible_P ;[row_1(index),column_1(index)] - m_half];
end



%Matrix(1:9,1:9)
for p = 1:size(possible_P,1)
i = possible_P(p,1);
j = possible_P(p,2);
if i <1 || j < 1
    continue % if the square is not in the board then pass
end
m_f_c_move = [i,j] + m_full_center;
m_f_s_move = [i,j] + m_full_side;
m_h_move = [i,j] + m_half;
candidate_for_P = 0;
    if  (m_f_s_move(1) >0 && m_f_s_move(2) >0) && (j >3) 
            if Matrix(m_f_s_move(1), m_f_s_move(2)) == 1
                candidate_for_P = candidate_for_P +1;
            else
                candidate_for_P = candidate_for_P -100; % This will discard the candidate
            end
    end
        if (m_f_c_move(1) >0 && m_f_c_move(2) >0) && (j>3) 
            if Matrix(m_f_c_move(1), m_f_c_move(2)) == 1
                candidate_for_P = candidate_for_P +1;
            else
                candidate_for_P = candidate_for_P -100; % This will discard the candidate

            end
        end

            if (m_h_move(1) >0 && m_h_move(2) >0) && (i > 1)

                if Matrix(m_h_move(1), m_h_move(2)) == 1
                    candidate_for_P = candidate_for_P +1;
                else
                    candidate_for_P = candidate_for_P -100; % This will discard the candidate
                end

            end


        if candidate_for_P > 0
                Matrix(i,j) = 0;
        end
end

%}
n = n+1;

end

% We can see a repeated pattern for each 9 rows

Matrix(1:9,1:9) == Matrix(10:18,1:9)

Matrix = Matrix(1:60, 1:60);
% save data explored
save("Matrix");

