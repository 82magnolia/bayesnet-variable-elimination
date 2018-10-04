function [var_list] = find_valid(keys)
var_list = [];
sample = keys{1};
for i = 1:size(sample,2)
    if sample(i) ~= 'N'
        var_list = union(var_list,i);
    end
end
end