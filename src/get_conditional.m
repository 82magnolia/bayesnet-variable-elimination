function [conditional_table] = get_conditional(joint_distrib,cond_vars,query_vars,default_str)
% joint_distrib is a probability table for the joint distribution
% cond_vars are variables that are conditioned ex)[1,3]
% query_vars are variables that are queried ex)[2,4]
cond_keys = gen_key(cond_vars,default_str);
query_keys = gen_key(query_vars,default_str);
new_keys = cell(1,size(cond_keys,2)*size(query_keys,2));
new_values = [];
key_count = 1;
for i = 1:size(cond_keys,2)
    temp_values = zeros(1,size(query_keys,2));
    for j = 1:size(query_keys,2)
        new_keys{key_count} = key_join(cond_keys{i},query_keys{j});
        temp_values(j) = joint_distrib(new_keys{key_count});
        key_count = key_count + 1;
    end
    temp_values = temp_values/sum(temp_values);
    new_values = [new_values,temp_values];
end
conditional_table = containers.Map(new_keys,new_values);
end

function [new_key] = key_join(key1,key2)
new_key = key1;
for i = 1:size(key2,2)
    if key2(i) ~= 'N'
        new_key(i) = key2(i);
    end
end
end