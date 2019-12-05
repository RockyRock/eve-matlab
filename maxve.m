function [E, x_e] = maxve(A, b)
% MAXVE function
% Function to find the maximum volume ellipsoid E inscribed in a polytopic
% convex set S define such that: S = {x | Ax <= b}.
% S is assumed to be bounded with non-empty interior.
% The inputs of the function are A and b respectivelly the matrix and
% vector defining the polyhedron inequalities.
% The outputs of the function are E and x_e repsectivelly the ellipsoid
% matrix and center.

% R. Guicherd - November 2019
%% Sanity check

S = Polyhedron('A', A, 'b', b);

% Check for empty set
if S.isEmptySet()
    error('S is an empty polyhedron!')
end

% Check for bounded polyhedron
if ~S.isBounded()
    error('S is not a bounded polyhedron!')
end

% Extract polyhedron and inequality dimensions
n = size(A, 2);
m = size(b, 1);

%% Optimization problem
% Optimization variables
B = sdpvar(n,n);
d = sdpvar(n,1,'full');

% Constraints
Cons = [];
for i = 1:1:m
    Cons = [Cons, norm(B*A(i,:)', 2) + A(i,:)*d <= b(i)]; %#ok<AGROW>
end
clearvars i

% Options
Opts = sdpsettings('solver', 'sedumi', 'sedumi.eps', 1e-9, 'verbose', 1);

% Optimization
optimize(Cons, -logdet(B), Opts)

% Extract the values of B and d
E = value(B);
x_e = value(d);

end
%%%%% END OF MAXVE FUNCTION %%%%%