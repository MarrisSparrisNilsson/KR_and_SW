% cell(R,C,N).

% XXS puzzle
cell(0,0,2). cell(0,1,1). cell(0,2,0).
cell(1,0,0). cell(1,1,0). cell(1,2,3).

% XS puzzle
cell(0,0,2). cell(0,1,1). cell(0,2,0). cell(0,3,3).
cell(1,0,0). cell(1,1,0). cell(1,2,3). cell(1,3,1).
cell(2,0,2). cell(2,1,1). cell(2,2,1). cell(2,3,0).

% Small puzzle
cell(0,0,2). cell(0,1,1). cell(0,2,0). cell(0,3,3). cell(0,4,3).
cell(1,0,0). cell(1,1,0). cell(1,2,3). cell(1,3,1). cell(1,4,2).
cell(2,0,2). cell(2,1,1). cell(2,2,1). cell(2,3,0). cell(2,4,2).
cell(3,0,0). cell(3,1,3). cell(3,2,2). cell(3,3,3). cell(3,4,1).

% Medium puzzle
cell(0,0,5). cell(0,1,6). cell(0,2,0). cell(0,3,3). cell(0,4,3). cell(0,5,5). cell(0,6,2). 
cell(1,0,4). cell(1,1,2). cell(1,2,1). cell(1,3,5). cell(1,4,5). cell(1,5,0). cell(1,6,0). 
cell(2,0,5). cell(2,1,5). cell(2,2,5). cell(2,3,2). cell(2,4,1). cell(2,5,2). cell(2,6,3). 
cell(3,0,3). cell(3,1,2). cell(3,2,2). cell(3,3,2). cell(3,4,1). cell(3,5,4). cell(3,6,0). 
cell(4,0,2). cell(4,1,1). cell(4,2,6). cell(4,3,5). cell(4,4,2). cell(4,5,2). cell(4,6,3). 
cell(5,0,2). cell(5,1,4). cell(5,2,0). cell(5,3,5). cell(5,4,2). cell(5,5,5). cell(5,6,1). 
cell(6,0,6). cell(6,1,2). cell(6,2,0). cell(6,3,6). cell(6,4,4). cell(6,5,1). cell(6,6,0).