function [new_obs_cell] = refine_obs_cell(target_key,obs_cell)
new_obs_cell = {};
cell_count = 1;
for i = 1:size(obs_cell,2)
    if target_key(obs_cell{i}{1}) ~= 'N'
        new_obs_cell{cell_count} = obs_cell{i};
        cell_count = cell_count + 1;
    end
end 