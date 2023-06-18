%{
This function is the CORE of approximataion via DCT.Here, We make decomposition of 3D coordinates into X-,
Y- and Z-axis ones.As the results, new decomposited X-,Y- and Z-axis coordinates are fitted with DCT.

[PARAS IN] :
curve ------ A CELL DATA STRUCTURE. It contains the coordinates of all 3D
outlines.The dimension of [curve] is the number of 3D profiles.
numHar ----- The number of harmonics used in the aprroximatation.

[PARAS OUT]:
coef ------ The coeffients matrix generated in the approximatation, whose 
dimension is [N*3numHar] and N is the number of profiles,
maxValHar -- The maximum value of harmonics of all profiles to get a
certain accuracy.
%}
function [coef, maxValHar] = DCT_fitting_curve(curve, numHar)
global DIM;
global FIGURE_FONT_SIZE;
global LINE_WIDTH;
LINE_WIDTH = 2;
FIGURE_FONT_SIZE = 10;
DIM = 3;
N = length(curve);
dim = size(curve{1}, 1);
if dim == DIM
    x = cell(N);
    y = cell(N);
    z = cell(N);
    Z = cell(N);
    coef = zeros(N, DIM*numHar);
    idx_x = zeros(N);
    idx_y = zeros(N);
    idx_z = zeros(N);
    for i = 1:N
        Z{i} = curve{i}';
        [x{i}, coef(i, 1:numHar), idx_x(i)] = dct_open(Z{i}(:, 1), numHar);
        [y{i}, coef(i, numHar+1:2*numHar), idx_y(i)] = dct_open(Z{i}(:, 2), numHar);
        [z{i}, coef(i, 2*numHar+1:3*numHar), idx_z(i)] = dct_open(Z{i}(:, 3), numHar);
        if i == 1
            plot3(Z{i}(:, 1), Z{i}(:, 2), Z{i}(:, 3), 'g', 'linewidth', LINE_WIDTH)
            hold on
            plot3(x{i}, y{i}, z{i}, 'm:', 'linewidth', LINE_WIDTH)
            legend('Original curve', 'Fitted curve')
            xlabel('X', 'fontsize', FIGURE_FONT_SIZE)
            ylabel('Y', 'fontsize', FIGURE_FONT_SIZE)
            zlabel('Z', 'fontsize', FIGURE_FONT_SIZE)
            view(-50, 20);
            grid on
            axis equal
        end
    end
    maxValHar = max(max([idx_x; idx_y; idx_z]));
end
