% calculate p(B|J,M)
variables % import probability tables
default_str = 'NNNNN';
p_list = {p_B,p_E,p_A_BE,p_J_A,p_M_A}; % Make a list of probabilities to be
% calculated in the correct order
p_partition = {[1],[2],[3,4,5]}; % The order 1~5 should not change: the only
% thing that should be modified is the partiion
query_list = [1,4,5];
elim_list = [2,3];
p_joint_BJM = var_elim(p_list,p_partition,query_list,elim_list,default_str);
cond_B_JM = get_conditional(p_joint_BJM,[4,5],[1],default_str);
%{
cond_B_JM.keys

ans =

  1×8 cell array

  Columns 1 through 7

    {'FNNFF'}    {'FNNFT'}    {'FNNTF'}    {'FNNTT'}    {'TNNFF'}    {'TNNFT'}    {'TNNTF'}

  Column 8

    {'TNNTT'}

cond_B_JM.values

ans =

  1×8 cell array

  Columns 1 through 6

    {[0.9987]}    {[0.9119]}    {[0.9944]}    {[0.6258]}    {[0.0013]}    {[0.0881]}

  Columns 7 through 8


    {[0.0056]}    {[0.3742]}

'TNNFF' indicates p(B=T|J=F,M=F) and so on
%}