% Time
time(0..10).

% Persons
man(m1; m2; m3).
woman(w1; w2; w3).
person(X) :- woman(X).
person(X) :- man(X).

% Married persons
married(w1, m1).
married(w2, m2).
married(w3, m3).
married(m1, w1).
married(m2, w2).
married(m3, w3).
married(X, Y) :- married(Y, X).

% Start position
at_bank(left, boat, 0).
at_bank(left, w1, 0).
at_bank(left, w2, 0).
at_bank(left, w3, 0).
at_bank(left, m1, 0).
at_bank(left, m2, 0).
at_bank(left, m3, 0).

river_sides(left, right).
river_sides(right, left).

% A person is on a location at step T+1,
% if it was there at step T and we do not have
% evidence that it is not there at T+1
at_bank(B, X, T+1) :- 
    at_bank(B, X, T),
    time(T),
    not -at_bank(B, X, T+1).


% Crossing rules
at_bank(B2, P, T+1) :- cross(P, T), at_bank(B, P, T), river_sides(B, B2), time(T).
-at_bank(B,P,T+1) :- cross(P,T), at_bank(B,P,T), river_sides(B, B2), time(T).



% Rule, only 2 persons can cross the river at the same time. 
{ cross(P, T) : at_bank(B, P, T) } <= 3 :- time(T), at_bank(B, boat, T).
:- cross(P, T), person(P), not cross(boat, T).
:- cross(boat,T), not 1 { cross(P,T) : person(P) }.


% Because of the jealous husband dilemma, a woman cannot be on the same side of the river with other men unless her husband is present.
:- at_bank(B, W, T), 
    at_bank(B, M, T),
    woman(W),
    man(M),
    not married(W, M),
    not at_bank(B, H, T) : married(H, W).

% Remove the possibility of women crossing if she is not traveling with her husband.
:- cross(M, T), cross(W, T), man(M), woman(W), not married(W, M).


% Goal state (everyone has crossed)
goal_reached :- 
    time(T),
    at_bank(right, w1, T+1),
    at_bank(right, w2, T+1),
    at_bank(right, w3, T+1),
    at_bank(right, m1, T+1),
    at_bank(right, m2, T+1),
    at_bank(right, m3, T+1).


:- not goal_reached.


#show cross/2.