function [result_table] = var_elim(p_list,p_partition,query_list,elim_list,default_str)
% One should specify variable orderings in 'variables.m'
% p_list is a cell containing probability tables: p_list should be sorted
% in the same order variables are eliminated
% p_partition is a cell containing groups of factors to be calculated at
% the same elimination step: ex){[1],[2],[3,4,5]}
% query_list is a list of query variables: ex)[1,4,5]
% ellim_list is a list of variables to eliminate in their respective
% orders: ex)[2,3] if variable 2 is eliminated after 3 is eliminated(it is
% analogous to the 'sigma' operation in variable elimination
% -1 is a placeholder indicating no more variables are left to be
% eliminated
% default_str designates input when no variable is in scope
if size(elim_list,2) ~= size(p_partition,2)
    elim_list = [-1,elim_list];
end
result_keys = gen_key(query_list,default_str);
result_values = zeros(1,size(result_keys,2));
for i = 1:size(result_keys,2)
    factors = cell(1,size(p_list,2));
    obs_cell = convert_from_key(result_keys{i});
    for j = 1:size(p_list,2)
        factors{j} = make_factor(obs_cell,p_list{j});
    end
    prod_factor = containers.Map({default_str},1.0);
    for j = size(p_partition,2):-1:1
        target_factors = factors(p_partition{j});
        target_factors{size(target_factors,2)+1} = prod_factor;
        prod_factor = make_product(target_factors,default_str);
        prod_factor = elim(prod_factor,elim_list(j),default_str);
    end    
    result_values(i) = prod_factor(default_str);
end
result_table = containers.Map(result_keys,result_values);
end

function [obs_cell] = convert_from_key(key)
obs_cell = {};
cell_count = 1;
for i = 1:size(key,2)
    if key(i) ~= 'N'
        obs_cell{cell_count} = {i,key(i)};
        cell_count = cell_count + 1;
    end    
end    
end
