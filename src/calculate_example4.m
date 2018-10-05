% calculate p(S,R|W)
variables2 % import probability tables
default_str = 'NNNN';
sampling_no = 15000;
[samples,emp_table] = direct_sample(p_list,sampling_no,default_str);
mod_emp_table = elim(emp_table,1,default_str);
cond_SR_W = get_conditional(mod_emp_table,[4],[2,3],default_str);