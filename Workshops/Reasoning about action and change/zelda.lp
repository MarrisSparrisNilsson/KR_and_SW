% table(c1, c2, c3, c4)
time(0..3).

% Initial state
on(0,2,k0,0).
on(1,1,k1,0).
on(1,2,k2,0).
on(1,4,k3,0).
on(2,2,k4,0).
on(2,3,k5,0).
on(2,4,k6,0).
on(3,3,k7,0).

knight(k0;k1;k2;k3;k4;k5;k6;k7).

occupied(X,Y,T) :- on(X,Y,_,T).

goal :- occupied(1,1,T),
        occupied(1,2,T),
        occupied(1,3,T),
        occupied(2,1,T),
        occupied(2,3,T),
        occupied(3,1,T),
        occupied(3,2,T),
        occupied(3,3,T).

:- not goal.

% A knight is on a location at step T+1,
% if it was there at step T and we do not have
% evidence that it is not there at T+1.
on(X,Y,K,T+1) :- on(X,Y,K,T), time(T), not -on(X,Y,K,T+1).

button(a;b;c;d).

% In each step, we press one button
{ push(B,T): button(B) } = 1 :- time(T).

% Effects of pressing the buttons
on(1,Y-1,K,T+1) :- push(a, T), on(1,Y,K,T).
-on(1,Y,K,T+1)  :- push(a, T), on(1,Y,K,T).

on(2,Y-1,K,T+1) :- push(b, T), on(2,Y,K,T).
-on(2,Y,K,T+1)  :- push(b, T), on(2,Y,K,T).

on(X+1,1,K,T+1) :- push(c, T), on(X,1,K,T).
-on(X,1,K,T+1)  :- push(c, T), on(X,1,K,T).

on(X+1,2,K,T+1) :- push(d, T), on(X,2,K,T).
-on(X,2,K,T+1)  :- push(d, T), on(X,2,K,T).

#show push/2.