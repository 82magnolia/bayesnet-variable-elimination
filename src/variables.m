% Variables are ordered in the following order:B,E,A,J,M
% probability notations: p(A|B,C) = p_A_BC
% p_B
keys = {'TNNNN','FNNNN'};
values = {0.01,0.99};
p_B = containers.Map(keys,values);
% p_E
keys = {'NTNNN','NFNNN'};
values = {0.009,0.991};
p_E = containers.Map(keys,values);
% p_A_BE
keys = {'TTTNN','FTTNN','TFTNN','FFTNN','TTFNN','FTFNN','TFFNN','FFFNN'};
values = {0.98,0.14,0.89,0.01,0.02,0.86,0.11,0.99};
p_A_BE = containers.Map(keys,values);
% p_J_A
keys = {'NNTTN','NNFTN','NNTFN','NNFFN'};
values = {0.65,0.08,0.35,0.92};
p_J_A = containers.Map(keys,values);
% p_M_A
keys = {'NNTNT','NNFNT','NNTNF','NNFNF'};
values = {0.94,0.03,0.06,0.97};
p_M_A = containers.Map(keys,values);

p_list = {p_B,p_E,p_A_BE,p_J_A,p_M_A};
