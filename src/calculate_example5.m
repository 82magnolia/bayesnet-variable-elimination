% Script for calculating differences between exact and empirical methods
calculate_example3
exact_table = cond_SR_W;
exact_joint = p_joint_SRW;
exact_values = cell2mat(exact_table.values);
calculate_example4
emp_table = cond_SR_W;
emp_joint = mod_emp_table;
emp_values = cell2mat(emp_table.values);
norm(emp_values-exact_values)
% Using 15000 samples gave an error rate of 0.0052
% To run an actual demo, clone the following gitbut repositoty:
% https://github.com/82magnolia/bayesnet-variable-elimination.git