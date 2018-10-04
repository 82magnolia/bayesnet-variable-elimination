function [factor] = make_product(factor_list,default_str)
% factor_list is a cell containing factors
% Simplifies factors: ex) f1(A)*f2(A,B,E)*f3(A,B) = f4(A,B,E)
var_list = [];
for i = 1:size(factor_list,2)
    var_list = union(var_list,find_valid(factor_list{i}.keys));
    var_list = var_list';
end
new_keys = gen_key(var_list,default_str);
new_value = zeros(1,size(new_keys,2));
val_count = 1;
for i = 1:size(new_keys,2)
    val = 1;
    for j = 1:size(factor_list,2)
        factor_keys = factor_list{j}.keys;
        ref_input = refine_input(factor_keys{1},new_keys{i});
        val = val * factor_list{j}(ref_input);
    end
    new_value(val_count) = val;
    val_count = val_count + 1;
end
factor = containers.Map(new_keys,new_value);
end