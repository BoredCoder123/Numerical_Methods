%%Description
%%This is a script in Matlab for Bisection Method. Bisection method has the
%%following steps:
%%1. Take 2 initial guesses as x0 and x1 where either (f(x0)=+ve and
%%f(x1)=-ve) or (f(x0)=-ve and f(x1)=+ve)
%%2. Now calculate x2=(x0+x1)/2 and f(x2).
%%3. If f(x2) is +ve take either of the x0 or x1 which ever is -ve and
%%inverse of it.
%%4. Assuming that it is x0 then taking x0=x0 and x1=x2 repeat the process 
%%for a desired amount of accuracy.

%%In this I would be calculating the zero of cos(x) at pi/2

%%Deletes any previous variables
clear all
clc

%%Initializing Variables
i=50; %Number of iterations
x0=0; %Initial lower limit
x1=2; %Initial higher limit
result=0; %Stores the resut

for j=1:50
    y0=cos(x0); %Initial value at x0
    y1=cos(x1); %Initial value at x1
    
    x=(x0+x1)/2; %Middle value
    y=cos(x); %Function value at middle value
    
    if(y==0) %If we have found the zero
        result=y;
        break;
    elseif(y>0) %If value at middle is +ve
        if(y0>0) %If value at initial guess is negative
            x0=x;
        elseif(y0<0) %If value at inital guess is positive
            x1=x;
        end
    elseif(y<0) %If value at middle is +ve
        if(y0>0) %If value at initial guess is negative
            x1=x;
        elseif(y0<0) %If value at inital guess is positive
            x0=x;
        end
    end
    if(j==50) %When to assign to result if result is not found
        result=x;
    end 
end

%%Finding true zero of function
fun=@cos; %Write the function
guess=1; %Initial guess
real_result=fzero(fun,3); %Real zero for tolerance of the function
tolerance=abs(result-real_result); %Tolerance of zero

fprintf('Zero found by the Bisection Method= %f\n',result);
fprintf('Tolerance in the zero= %f\n',tolerance);