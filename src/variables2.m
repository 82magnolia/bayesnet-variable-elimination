% Variables are ordered in the following order:C,S,R,W
% probability notations: p(A|B,C) = p_A_BC
% p_C
keys = {'TNNN','FNNN'};
values = {0.7,0.3};
p_C = containers.Map(keys,values);
% p_S_C
keys = {'TTNN','TFNN','FTNN','FFNN'};
values = {0.05,0.95,0.65,0.35};
p_S_C = containers.Map(keys,values);
% p_R_C
keys = {'TNTN','TNFN','FNTN','FNFN'};
values = {0.9,0.1,0.3,0.7};
p_R_C = containers.Map(keys,values);
% p_W_SR
keys = {'NTTT','NTTF','NTFT','NTFF','NFTT','NFTF','NFFT','NFFF'};
values = {0.99,0.01,0.85,0.15,0.8,0.2,0.1,0.9};
p_W_SR = containers.Map(keys,values);

p_list = {p_C,p_S_C,p_R_C,p_W_SR};
