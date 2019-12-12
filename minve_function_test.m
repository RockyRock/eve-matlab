% MINVE function test
% Test script for the minimum volume ellipsoid function

% R. Guicherd - December 2019
%% Polytope definition

% Vertex definition of polyhedron
V = [-1.7 -0.4; -0.4  0.7; 1.2 -0.8; 0 1.8; 1.3 0.9; -1.6 0.6; 0.3 -1.8];
P = Polyhedron(V);

% Store the inequality representation of P
P.computeHRep();
A = P.A;
b = P.b;

% Display polyhedron P in command window
disp('The polyhedron P is represented as follows: ')
evalin('base', 'P')

%% Chebyshev center computation using MPT

% Chebyshev center calculation
Cheb = P.chebyCenter();
x = sdpvar(2,1);
B = YSet(x, norm(x - Cheb.x, 2) <= Cheb.r);

% Plot of the Chebyshev center and ball
figure
hold on
P.plot('color', 'lightblue')
B.plot('wire', true)
plot(Cheb.x(1), Cheb.x(2), '+', 'MarkerSize', 4, 'Color', 'k');
axis equal
title('Polytope P and Chebyshev ball', 'interpreter', 'latex')
xlabel('$x_{1}$', 'interpreter', 'latex')
ylabel('$x_{2}$', 'interpreter', 'latex')

%% Solve the minimum volume covering ellipsoid problem

% Minimum volume covering ellipse optimization
[X,xe] = minve(V);

% Ellipse object definition
Elli = YSet(x, (x-xe)'/X*(x-xe) <= 1);

% Plot ellipse and ellipse center
Elli.plot('wire', true, 'LineStyle', '--', 'Color', 'r')
plot(xe(1), xe(2), 'x', 'MarkerSize', 4, 'Color', 'k');
hold off

%%%%% End of minve_function_test script %%%%%