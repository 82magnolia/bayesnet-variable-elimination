# bayesnet-variable-elimination
MATLAB implementation of variable elimination in bayesian networks. Since variable elimination is essentially based on factors, it is also possible to use the implementation on MRFs, CRFs, etc.
# Run a demo
Clone the github repository and try running calculate_example1.m and calculate_example2.m. These codes will produce conditional probabilities of P(B|J,M) and P(E|J,M) for the Bayesian network provided in 'calc_example_bayesnet'.
# Implementation details
Each factor was represented using MATLAB containers.MAP(a.k.a hash tables). In addition each variable configuration is represented using a string. For example, if a model has 3 binary parameters A, B, and C and A = 1, B = 0, C = 1, then a string representing this configuration would be 'TFT'. Also, an auxilliary character 'N' was used to depict situations in which certain variables are out of scope.
# TODO
For now, the implementation only works on bayesian networks with binary variables.
