% we start in Skåne
start(skone).

link(X,Y) :- link(Y,X).
county(X) :- link(X,_).

% County links (land and sea)
link(skone,(halland;smaland;blekinge)).
link(halland,(smaland;vastergotland;bohuslan)).
link(smaland,(blekinge;oland;gotland;ostergotland;vastergotland)).
link(blekinge,oland).
link(oland,gotland).
link(vastergotland,(bohuslan;dalsland;narke;smaland)).
link(bohuslan,dalsland).
link(dalsland,varmland).
link(varmland,(narke;vastmanland;dalarna)).
link(ostergotland,(narke;sodermanland)).
link(narke,(sodermanland;vastmanland)).
link(sodermanland,(vastmanland;uppland)).
link(vastmanland,(uppland;gastrikland;dalarna)).
link(dalarna,(gastrikland;halsingland;harjedalen)).
link(gastrikland,halsingland).
link(harjedalen,(halsingland;medelpad;jamtland)).
link(halsingland,medelpad).
link(medelpad,(jamtland;angermanland)).
link(jamtland,(angermanland;lappland)).
link(angermanland,(lappland;vasterbotten)).
link(lappland,(vasterbotten;norrbotten)).
link(vasterbotten,norrbotten).

