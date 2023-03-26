function[output] = vec(input)

%output = reshape(input, size(input,1)*size(input,2),1);
output = input(:);