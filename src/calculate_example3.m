% calculate p(S,R|W)
variables2 % import probability tables
default_str = 'NNNN';
p_list = {p_W_SR,p_C,p_S_C,p_R_C};
p_partition = {[1],[2,3,4]}; % The order 1~5 should not change: the only
% thing that should be modified is the partition
query_list = [2,3,4];
elim_list = [1];
p_joint_SRW = var_elim(p_list,p_partition,query_list,elim_list,default_str);
cond_SR_W = get_conditional(p_joint_SRW,[4],[2,3],default_str);