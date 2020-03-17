function F = Fib(n)
%function calculates the nth Fibonacci number in O(n) time or better
% Fib(n) is calculated without using any "for" or "while" loops.
% [1] http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fibonacci/fibFormula.html

Phi = (sqrt(5) + 1) / 2; %golden section number
p = Phi - 1; %reciprocal of Phi
F = (Phi^n - (-p)^n) / sqrt(5); %Fibonacci number
end

