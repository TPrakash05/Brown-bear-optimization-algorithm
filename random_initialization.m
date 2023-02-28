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
% # function X = random_initialization(NumberofBrownBears,D,max,min)    # %
% #                                                                     # %
% # Output: X = Solution matrix                                         # %
% #                                                                     # %
% # Input:  NumberofBrownBears = Number of solutions                    # %
% #         D = dimesion of the problem                                 # %
% #         max = upper limit of variable                               # %
% #         min = upper limit of variable                               # %    

% Function defined below intializes population randomly
function X = random_initialization(NumberofBrownBears,max,min)

R= NumberofBrownBears;
X=rand(R,1)*(max-min)+(ones(R,1)*min);
    