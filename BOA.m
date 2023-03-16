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
% # function [Best_sol,Best_X,Convergence]=BOA(NumberofBrownBears,...   # %
% #                                        D,Max_iter,Min,Max)          # %
% #                                                                     # %
% # Output: Best_sol = Global best solution                             # %
% #         Best_X = Global best position                               # %
% #         Convergence = Covergence curve values                       # %
% # Input:  NumberofBrownBears = Number of solutions                    # %
% #         D = dimesion of the problem                                 # %
% #         Max_iter = Maximum number of iterations                     # %
% #         Max = upper limit of variable                               # %
% #         Min = upper limit of variable                               # % 

% This function implements Brown-bear optimization algorithm
function [Best_sol,Best_X,Convergence]=BOA(NumberofBrownBears,D,Max_iter,Min,Max)

noP=NumberofBrownBears;

% Initializations before the main loop
iter=Max_iter;
Best_X=zeros(1,D);
Convergence=zeros(1,iter);

% Random initialization of number of brown-bears or so;utions.
X=random_initialization(noP,Max,Min);

% Initialize Best solution for minimization of objective function
Best_sol=inf;
t=1;     
    
while t<=iter 
    % For limiting out of bound solutions and setting best solution and
    % objective function value
    for i=1:size(X,1)  
        Indx_max=X(i,:)>Max;
        Indx_min=X(i,:)<Min;
        X(i,:)=(X(i,:).*(~(Indx_max+Indx_min)))+Max.*Indx_max+Min.*Indx_min;
        %Evaluate objective function for each solution
        fitness=objective_function(X(i,:));
        
        if(Best_sol>fitness)
            Best_sol=fitness;
            Best_X=X(i,:);
        end
    end
%% Pedal Marking Behaviour....STARTS
   
    [min_fit, Indx1]=min(fitness);
    Best_fit=X(Indx1,:);
    [max_fit, Indx2]=max(fitness);
    Worst_fit=X(Indx2,:);
    clear Indx1 Indx2
    
    P=t/iter;
    for ii=1:noP
        if P>0 && P<=iter/3; % Gait while walking
            newX(ii,:)= X(ii,:) + (-P*rand(1,D).*X(ii,:) );
        elseif P>iter/3 && P<=2*iter/3 % Careful Stepping
            Q = P*rand(1,D);
            Step = round (1 + rand());
            newX(ii,:)= X(ii,:) + (Q.*(Best_fit-(Step*Worst_fit)));
        elseif P> 2*iter/3 && P<= 1
            W = 2*P*pi*rand(1,D); %angular velocity
            newX(ii,:)= X(ii,:) + ((W.*Best_fit- abs(X(ii,:)))-(W.*Worst_fit- abs(X(ii,:))));
        end        
    end
    for ii=1:noP
       newfitness=objective_function(newX(ii,:));
        if newfitness<fitness
            X(ii,:)=newX(ii,:);
        else 
            X(ii,:)=X(ii,:);
        end
         fitness=objective_function(X(ii,:));
    end
   
        %% Pedal marking behaviour..... ends
    %% Sniffing of pedal marks......  starts
    for ii=1:noP
            k=round(rand()*(noP));
            while k==ii || k<=0
                k=round(rand()*(noP));
            end

            if objective_function(X(ii,:))<objective_function(X(k,:))
                r=rand()*ones(1,D);
                newX(ii,:)=X(ii,:)+r.*( X(ii,:) - X(k,:) );

            else
                r=rand()*ones(1,D);
                newX(ii,:)=X(ii,:)+r.*( - X(ii,:) + X(k,:) );
            end 
    end 
    for ii=1:noP
       newfitness=objective_function(newX(ii,:));
        if newfitness<fitness
            X(ii,:)=newX(ii,:);
        else 
            X(ii,:)=X(ii,:);
        end
    end

    t=t+1;
    Convergence(t)=Best_sol;
end

end
