
% Get all numbers from the cells
puzzle_numbers(N) :- cell(_, _, N).
% List of all unordered domino combinations
domino(N1, N2) :- puzzle_numbers(N1), puzzle_numbers(N2), N1 <= N2.

% Check that all pairs are symmetric
pair(R1, C1, R2, C2) :- pair(R2, C2, R1, C1).

% Horizontal adjacency.
adjacent(R, C, R, C+1) :- cell(R, C, _), cell(R, C+1, _).
adjacent(R, C+1, R, C) :- cell(R, C, _), cell(R, C+1, _).

% Vertical adjacency.
adjacent(R, C, R+1, C) :- cell(R, C, _), cell(R+1, C, _).
adjacent(R+1, C, R, C) :- cell(R, C, _), cell(R+1, C, _).

% Guess a solution
{ pair(R1, C1, R2, C2) : adjacent(R1, C1, R2, C2) } = 1 :- cell(R1, C1, _).

% A used domino, is one where there exists a domino combination of numbers N1 and N2, and there also exist a pair
% of row and column combinations (cells) where it's rows and columns include in cells that have the same number combination
% as a given domino number combination.
used_domino(N1, N2) :- 
    domino(N1, N2),
    pair(R1, C1, R2, C2), 
    cell(R1, C1, N1), 
    cell(R2, C2, N2).

% Check that every domino is used for every combination.
% (Remove the possibility that every domino combination has not been used).
:- domino(N1, N2), not used_domino(N1, N2).

#show pair/4.
% #show domino/2.
