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
% #                                                                     # %
% # function f_obj= objective_function(X)                               # %
% #                                                                     # %
% # Output: f_obj = Objective function output                           # %
% #                                                                     # %
% # Input:  X = NumberofBrownBears = Number of solutions                # %
% #         D = dimesion of the problem                                 # %
% #         max = upper limit of variable                               # %
% #         min = upper limit of variable                               # % 

% This function implements the sphere objective function
function f_obj= objective_function(X)
f_obj=sum(X.^2);
end

