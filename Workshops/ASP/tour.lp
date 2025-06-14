% GUESS a roundtrip using in/2 **********
% for each county, select one outgoing link
{ in(X,Y): link(X,Y) } = 1 :- county(X).
% for each county, select one incoming link
{ in(X,Y): link(X, Y) } = 1 :- county(Y).

% CHECK if we reach all counties ********
% reach(X) ... X is reachable from the start
reach(X) :- start(X).
reach(Y) :- reach(X), in(X, Y).

% every county must be reachable from the start
:- county(X), not reach(X).