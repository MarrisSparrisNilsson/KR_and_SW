% cell(R,C,N).

% Valid Game Boards should be (R x R+1)
% and the numbers should be (0,0)..(R-1,R-1)

% % XXS puzzle - (2x3)
% cell(0,0,1). cell(0,1,1). cell(0,2,0).
% cell(1,0,0). cell(1,1,1). cell(1,2,0).

% % XS puzzle - (3x4)
% cell(0,0,2). cell(0,1,1). cell(0,2,0). cell(0,3,3).
% cell(1,0,0). cell(1,1,0). cell(1,2,3). cell(1,3,1).
% cell(2,0,2). cell(2,1,1). cell(2,2,1). cell(2,3,0).

% Small puzzle - (4x5) (Original Example)
cell(0,0,2). cell(0,1,1). cell(0,2,0). cell(0,3,3). cell(0,4,3).
cell(1,0,0). cell(1,1,0). cell(1,2,3). cell(1,3,1). cell(1,4,2).
cell(2,0,2). cell(2,1,1). cell(2,2,1). cell(2,3,0). cell(2,4,2).
cell(3,0,0). cell(3,1,3). cell(3,2,2). cell(3,3,3). cell(3,4,1).

% Small puzzle - (4x5)
% cell(0,0,1). cell(0,1,1). cell(0,2,0). cell(0,3,3). cell(0,4,3).
% cell(1,0,0). cell(1,1,3). cell(1,2,1). cell(1,3,2). cell(1,4,1).
% cell(2,0,2). cell(2,1,3). cell(2,2,1). cell(2,3,0). cell(2,4,0).
% cell(3,0,2). cell(3,1,0). cell(3,2,3). cell(3,3,2). cell(3,4,2).

% % Medium 1 puzzle - (6x7)
% cell(0,0,4). cell(0,1,1). cell(0,2,1). cell(0,3,2). cell(0,4,2). cell(0,5,2). cell(0,6,4).
% cell(1,0,5). cell(1,1,0). cell(1,2,3). cell(1,3,3). cell(1,4,0). cell(1,5,5). cell(1,6,0).
% cell(2,0,0). cell(2,1,4). cell(2,2,4). cell(2,3,2). cell(2,4,3). cell(2,5,3). cell(2,6,3).
% cell(3,0,2). cell(3,1,2). cell(3,2,0). cell(3,3,5). cell(3,4,5). cell(3,5,5). cell(3,6,4).
% cell(4,0,3). cell(4,1,1). cell(4,2,3). cell(4,3,4). cell(4,4,2). cell(4,5,1). cell(4,6,1).
% cell(5,0,5). cell(5,1,0). cell(5,2,0). cell(5,3,1). cell(5,4,1). cell(5,5,5). cell(5,6,4).

% % Medium 2 puzzle - (7x8)
% cell(0,0,5). cell(0,1,6). cell(0,2,0). cell(0,3,3). cell(0,4,3). cell(0,5,5). cell(0,6,2). cell(0,7,6). 
% cell(1,0,4). cell(1,1,2). cell(1,2,1). cell(1,3,5). cell(1,4,5). cell(1,5,0). cell(1,6,0). cell(1,7,0). 
% cell(2,0,5). cell(2,1,5). cell(2,2,5). cell(2,3,2). cell(2,4,1). cell(2,5,2). cell(2,6,3). cell(2,7,3). 
% cell(3,0,3). cell(3,1,2). cell(3,2,2). cell(3,3,2). cell(3,4,1). cell(3,5,4). cell(3,6,0). cell(3,7,5). 
% cell(4,0,2). cell(4,1,1). cell(4,2,6). cell(4,3,5). cell(4,4,2). cell(4,5,2). cell(4,6,3). cell(4,7,3). 
% cell(5,0,2). cell(5,1,4). cell(5,2,0). cell(5,3,5). cell(5,4,2). cell(5,5,5). cell(5,6,1). cell(5,7,1). 
% cell(6,0,6). cell(6,1,2). cell(6,2,0). cell(6,3,6). cell(6,4,4). cell(6,5,1). cell(6,6,0). cell(6,7,2).