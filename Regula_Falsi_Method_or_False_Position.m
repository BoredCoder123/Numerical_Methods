%%This is a MatLab program to calculate the zero of the a function
%%containing one variable by Regula Falsi Method or Method of False
%%Position or just False Position.

%%Steps for calculating zero:
%%1. x2 as (x0*f(x1)-x1*f(x0))/(f(x1)-f(x0)) where x0 and x1 are
%%the values are initial guess where the zero lies.
%%2. If f(x0)*f(x2)<0 then x1=x2 else x0=x2

%Function is cos(x), zero lies at pi/2. In the end I would subtract from
%the real zero to obtain tolerance of the function.

clear all;
clc;

%%Intializing Variables
x0=1; %Guess that lies before the actual value
x1=2; %Guess that lies after the actual value
x2=x0; %Initial value of the result
result=0; %Stores the result
n=50; %Number of iterations
tolerance=0; %Variable to store the tolerance of a answer

for i=0:n
    if(cos(x2)==0)
        result=x2;
        break
    end
    x2=(x0*cos(x1)-x1*cos(x0))/(cos(x1)-cos(x0));
    if(cos(x0)*cos(x2)<0)
        x1=x2;
    else
        x0=x2;
    end
    if (i==n)
        result=x2;
    end
end

%%Finding true zero of function
fun=@cos; %Write the function
guess=1; %Initial guess
real_result=fzero(fun,guess); %Real zero for tolerance of the function
tolerance=abs(result-real_result); %Tolerance of zero

fprintf('Zero found by the Netwon Raphsons Method= %f\n',result);
fprintf('Tolerance in the zero= %f\n',tolerance);