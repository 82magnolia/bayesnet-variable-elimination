function [simp_factor] = elim(factor,target_no,default_str)
% factor is a hash table
% target_no indicates the variable to be eliminated if -1, no variable is
% eliminated
if target_no == -1
    simp_factor = factor;
else
    factor_var_list = find_valid(factor.keys);
    new_var_list = setdiff(factor_var_list,target_no);
    new_keys = gen_key(new_var_list,default_str);
    new_value = [];
    for i = 1:size(new_keys,2)
        T_key = new_keys{i};
        F_key = new_keys{i};
        T_key(target_no) = 'T';
        F_key(target_no) = 'F';
        new_value(i) = factor(T_key)+factor(F_key);
    end
    simp_factor = containers.Map(new_keys,new_value);
    simp_factor;
end
end