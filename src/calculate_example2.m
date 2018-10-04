% calculate p(E|J,M)
variables % import probability tables
default_str = 'NNNNN';
p_list = {p_E,p_B,p_A_BE,p_J_A,p_M_A};
p_partition = {[1],[2],[3,4,5]}; % The order 1~5 should not change: the only
% thing that should be modified is the partition
query_list = [2,4,5];
elim_list = [1,3];
p_joint_EJM = var_elim(p_list,p_partition,query_list,elim_list,default_str);
cond_E_JM = get_conditional(p_joint_EJM,[4,5],[2],default_str);