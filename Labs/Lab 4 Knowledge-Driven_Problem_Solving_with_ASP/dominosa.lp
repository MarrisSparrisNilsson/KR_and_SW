time(0..50).


pair(R1,C1,R2,C2) :- 
1 <= {cell(R1,C1,N1), cell(R2,C2,N2): R1-R2 }



occupied(R,C) :- pair(R,C,_,_).

goal :- 

