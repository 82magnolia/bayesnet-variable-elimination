function [new_keys] = gen_key(var_list,default_str)
% var_list is a vector containing variables that are present in the scope
% ex) [2,3,4]
new_keys = {default_str}; % if number of variables increase, this term should be modified
for i = 1:size(var_list,2)
    new_keys = modify_key(new_keys,var_list(i));
end
end

function [mod_key] = modify_key(input_keys,var_pos)
mod_key = cell(1,2*size(input_keys,2));
for i = 1:size(input_keys,2)
    mod_T = input_keys{i};
    mod_F = input_keys{i};
    mod_T(var_pos) = 'T';
    mod_F(var_pos) = 'F';
    mod_key{2*i-1} = mod_T;
    mod_key{2*i} = mod_F;
end
end