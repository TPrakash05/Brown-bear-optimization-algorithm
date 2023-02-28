% # Brown-bear Optimization Algorithm                                   # % 
% #                                                                     # %
% # Mathematically Modelled in MATLAB 2022a                             # % 
% #                                                                     # %
% # Developer and coder: Tapan Prakash                                  # %
% #                                                                     # %
% # Contact:    tapan.prakash@vit.ac.in                                 # %
% #             tapanprakashsinha@gmail.com                             # %
% #                                                                     # %
% # Please cite: Tapan Prakash, Praveen Prakash Singh, Vinay Pratap     # % 
% #              Singh, and Sri Niwas Singh. "A Novel Brown-bear        # % 
% #              Optimization Algorithm for Solving Economic Dispatch   # % 
% #              Problem." In Advanced Control & Optimization Paradigms # % 
% #              for Energy System Operation and Management, pp. 137-   # %
% #              164. River Publishers, 2023.                           # %

% This is the main program file needed to be run.

clear;
clc;

Total_run=10;  
NumberofBrownBears=30; % Number of brown-bears (solutions)
D=30; % dimesnsion of the problem
Min=ones(1,D)*(-100); % Minimum value of each variable
Max=ones(1,D)*(100); % Maximum value of each variable
Max_iter=100; % Maximum numbef of iterations

% Best_sol=zeros(Total_run); Best_X=zeros(Total_run,D); 
% Convergence=zeros(Total_run,D);

for ii=1:Total_run
[Best_sol(ii),Best_X(ii,:),Convergence(ii,:)]=BOA...
    (NumberofBrownBears,D,Max_iter,Min,Max);
end

Std_dev=std(Best_sol);
Mean_score=min(Best_sol);
[gBest_sol, idx]=min(Best_sol);
gBest_X=Best_X(idx,:);
gConvergence=Convergence(idx,:); clear idx;

semilogy(gConvergence(1,2:end),'k','LineWidth',2);
legend('BOA');
xlabel('Number of iterartions');
ylabel('Objective function value');
title('Convergence of BOA');



        



