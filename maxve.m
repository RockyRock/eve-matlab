function [B, d] = maxve(A, b)
% MAXVE function: [B, d] = maxve(A, b)
% Function to find the maximum volume ellipsoid E inscribed in a polytopic
% convex set P define such that
%
% P = {x | Ax <= b}.
%
% P is assumed to be bounded with non-empty interior.
% The inputs of the function are A and b respectivelly the matrix and
% vector defining the polyhedron inequalities.
% The outputs of the function are B and d repsectivelly the ellipsoid
% matrix and center, such that the ellipsoid E is defined as follows
%
% E = {Bu + d | norm(u, 2) <=1}.

% R. Guicherd - November 2019
%% Sanity check

P = Polyhedron('A', A, 'b', b);

% Check for empty set
if P.isEmptySet()
    error('S is an empty polyhedron!')
end

% Check for bounded polyhedron
if ~P.isBounded()
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
B = value(B);
d = value(d);

end
%%%%% END OF MAXVE FUNCTION %%%%%