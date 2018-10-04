function [new_input] = refine_input(target_key,query_string)
% Refines input to take care of out-of-scope variables 
new_input = query_string;
for i = 1:size(query_string,2)
    if target_key(i) == 'N'
        new_input(i) = 'N';
    end
end 