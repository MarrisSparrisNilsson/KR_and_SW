time(0..10)

husband(m1).
husband(m2).
husband(m3).
wife(w1).
wife(w2).
wife(w3).

% Married Couples
marriedTo(m1,w1).
marriedTo(m2,w2).
marriedTo(m3,w3).

% Sides
% opposite(left, right).
% opposite(right, left).

% Start
at_bank(left,boat,0).
at_bank(left,m1,0).
at_bank(left,m2,0).
at_bank(left,m3,0).
at_bank(left,w1,0).
at_bank(left,w2,0).
at_bank(left,w3,0).

% Goal
all_has_passed :-   at_bank(right,boat,10),
                    at_bank(right,m1,10),
                    at_bank(right,m2,10),
                    at_bank(right,m3,10),
                    at_bank(right,w1,10),
                    at_bank(right,w2,10),
                    at_bank(right,w3,10),

:- not all_has_passed.

% Max travelers
1 <= { cross(P1, T), cross(P2, T): P1 != P2 } <= 2 :- time(T)
% 1 <= { cross(P, T):  } <= 2 :- time(T)

% Inertia (Object in motion)
% An object has passed to the opposite side if it was at the starting side 
has_passed(B,S,T+1) :- has_passed(B,S,T), time(T), not -has_passed(B,S,T+1).

move(P, T) :- {at_bank()}

% Effect of one or two people crossing
cross(P, T+1) :- {at_bank(Start,P,T), at_bank(End,P,T+1): Start != End}

% Two people cannot cross
% :- {cross(P1, T), cross(P2, T): marriedTo(P1,P2); marriedTo(P2,P1)}

% One example of a crossing plan to get everyone across the river
cross(w3,0) cross(w1,0)
cross(w1,1)
cross(w2,2) cross(w1,2)
cross(w1,3)
cross(m3,4) cross(m2,4)
cross(m2,5) cross(w2,5)
cross(m2,6) cross(m1,6)
cross(w3,7)
cross(w2,8) cross(w1,8)
cross(m3,9)
cross(w3,10) cross(m3,10)