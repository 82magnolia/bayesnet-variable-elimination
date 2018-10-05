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
%{
cond_E_JM.keys

ans =

  1×8 cell array

  Columns 1 through 7

    {'NFNFF'}    {'NFNFT'}    {'NFNTF'}    {'NFNTT'}    {'NTNFF'}    {'NTNFT'}    {'NTNTF'}

  Column 8

    {'NTNTT'}

cond_E_JM.values

ans =

  1×8 cell array

  Columns 1 through 6

    {[0.9922]}    {[0.9806]}    {[0.9916]}    {[0.9427]}    {[0.0078]}    {[0.0194]}

  Columns 7 through 8

    {[0.0084]}    {[0.0573]}

'TNNFF' indicates p(E=T|J=F,M=F) and so on


%}
% To run an actual demo, clone the following gitbut repositoty:
% https://github.com/82magnolia/bayesnet-variable-elimination.git