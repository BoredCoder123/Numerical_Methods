%%This is a MatLab code to calculate the zero of an equation with one
%%variable with the help of Netwon Raphson's Method.

%%Steps for Newton Raphson's Method
%%1. Take an initial guess value x0.
%%2. The next value of x is calculated by x1=x0-f(x0)/f'(x1) where f'(x) is
%%the first derivative of function f at value x.

%%In this example I would approximate the zero for cos(x) at the value
%%pi/2. I would then subtract from the real value to obtain the tolerance
%%of the function.

clear all;
clc;

%%Declaing initial values of the variables
i=50; %Number of iterations
x0=1; %Initial guess
x1=0; %Variable to store the next guess
result=0; %Variable to store the result

%Function is cos(x)
%Its derivative is -sin(x). Replace them by your own functions.

for i=0:50 %Runs the loop
    if(cos(x0)==0) %Condition to break if the loop is already satisfied
        result=x0;
        break;
    end
    x1=x0+(cos(x0)/sin(x0)); %Formula for Newton Raphson's Method
    x0=x1; %Assigning x1 to x0;
    
    if (i==50) %When to assign result if the initial condition is never satisfied
        result=x0;
    end
end

%%Finding true zero of function
fun=@cos; %Write the function
guess=1; %Initial guess
real_result=fzero(fun,guess); %Real zero for tolerance of the function
tolerance=abs(result-real_result); %Tolerance of zero

fprintf('Zero found by the Netwon Raphsons Method= %f\n',result);
fprintf('Tolerance in the zero= %f\n',tolerance);