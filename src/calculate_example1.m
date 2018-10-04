% calculate p(B|J,M)
variables % import probability tables
default_str = 'NNNNN';
p_list = {p_B,p_E,p_A_BE,p_J_A,p_M_A}; % Make a list of probabilities to be
% calculated in the correct order
p_partition = {[1],[2],[3,4,5]}; % The order 1~5 should not change: the only
% thing that should be modified is the partition
query_list = [1,4,5];
elim_list = [2,3];
p_joint_BJM = var_elim(p_list,p_partition,query_list,elim_list,default_str);
cond_B_JM = get_conditional(p_joint_BJM,[4,5],[1],default_str);
