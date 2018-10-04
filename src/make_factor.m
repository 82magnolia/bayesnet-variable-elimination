function [factor] = make_factor(obs_cell,p_table)
% obs_cell: Cell specifying observed variables ex){{3,'T'},{4,'F'}}
% p_table: Input probability table
orig_keys = p_table.keys;
obs_cell = refine_obs_cell(orig_keys{1},obs_cell);
keys = refine_keys_obs(p_table.keys,obs_cell);
value = zeros(1,size(keys,2));
for i = 1:size(keys,2)
    value(i) = p_table(keys{i});
    for j = 1:size(obs_cell,2)
        keys{i}(obs_cell{j}{1}) = 'N';
    end
end
factor = containers.Map(keys,value);
end