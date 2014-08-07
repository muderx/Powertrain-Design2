clear all
close all
clc
tic 

FD = 3.4; % Final Drive Ratio
G = 3;

%%%%%%%%%%% RUN OPTIMIZATION %%%%%%%%%%%%%%%%%%%%%%

% Identify the Design Variables and their ranges    
dv_names={ 'FD', 'G'};
x_L=[    0.5*FD, 0.5*G]';
x_U=[    1.5*FD, 1.5*G]';
   
con_names={'FAIL_DP'}; % They Also Did not Do Grade and Acceleration Tests!
c_L=[        0;     ];
c_U=[        1;     ];

% Define the Problem
PriLev = 2;                      % 1 is no graph 2 shows a graph
MaxEval = 5;
MaxIter = 4;
GLOBAL.epsilon = 1e-4;

% Define the Objective function Name for the GRAPH
resp_names={'DP'};

p_f='OBJECTIVE';
p_c='CONSTRAINTS';

A=[];
b_L=[];
b_U=[];
I=[];
cont_bool=0;    % Continue from a Previous Run??
prev_results_filename='DP';

if cont_bool==1
   eval(['load(''',prev_results_filename,''')']) 
   GLOBAL = DP_optimization.GLOBAL;
   GLOBAL.MaxEval = MaxEval;
   GLOBAL.MaxIter = MaxIter;
else
   GLOBAL.MaxEval = MaxEval;
   GLOBAL.MaxIter = MaxIter;
end

plot_info.var_label=dv_names;
plot_info.var_ub=num2cell(x_U);
plot_info.var_lb=num2cell(x_L);
plot_info.con_label=con_names;
plot_info.con_ub=num2cell(c_U);
plot_info.con_lb=num2cell(c_L);
plot_info.fun_label=resp_names;

% start the optimization
DP_optimization = gclSolve(p_f, p_c, x_L, x_U, A, b_L, b_U, c_L, c_U, I, GLOBAL, PriLev, plot_info, dv_names, resp_names, con_names);

% save the results
eval(['save(''',prev_results_filename,''',','''DP_optimization'');']) 

PlotOptimResults(DP_optimization.GLOBAL.f_min_hist, plot_info)

% end timer
toc