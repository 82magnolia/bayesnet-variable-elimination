function [samples,emp_table] = direct_sample(p_list,sampling_no,default_str)
% sampling_no is the total number of times to sample
samples = repmat({default_str},1,sampling_no);
emp_table_keys = gen_key(1:size(default_str,2),default_str);
emp_table_values = zeros(1,size(emp_table_keys,2));
emp_table = containers.Map(emp_table_keys,emp_table_values);
for i = 1:sampling_no
    for j = 1:size(p_list,2)
        samples{i}(j) = 'T';
        test = rand;
        prob_keys = p_list{j}.keys;
        target_key = prob_keys{1};
        new_input = refine_input(target_key,samples{i});
        p_table = p_list{j};
        if test > p_table(new_input)
            samples{i}(j) = 'F';
        end
    end
    % samples{i} = modify_sample(samples{i});
    emp_table(samples{i}) = emp_table(samples{i}) + 1;
end
temp = cell2mat(emp_table.values);
temp = temp/sampling_no;
emp_table = containers.Map(emp_table.keys,temp);
end

function[new_sample] = modify_sample(sample)
new_sample = sample;
for i = 1:size(sample,2)
    if sample(i) == 'T'
        new_sample(i) = 'F';
    else
        new_sample(i) = 'T';
    end
end
end