function [new_keys] = refine_keys_obs(target_keys,obs_cell)
new_keys = {};
key_count = 1;
for i = 1:size(target_keys,2)
    validity = true;
    for j = 1:size(obs_cell,2)
        if target_keys{i}(obs_cell{j}{1}) ~= obs_cell{j}{2}
            validity = false;
            break;
        end
    end
    if validity == true
        new_keys{key_count} = target_keys{i};
        key_count = key_count + 1;
    end
end