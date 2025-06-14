% Every paper gets assigned to at least 2 and at most 3 reviewers
2 <= {asg(P,R) : reviewer(R)} <= 3 :- paper(P).

% CHECK: No reviwer gets to read more than 4 papers

% CHECK: It is not allowed that a reviwer gets more than 4 papers
:- reviewer(R), #count{ P: asg(P, R) } > 4.


% A paper must not be assigned to a reviwer who has a 
% conflict of interest with that paper!

% CHECK: No conflicts of interest with that reviewer
:- asg(P,R), conflict(R, P).