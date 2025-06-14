%He Tan, 2024-10
%
%
%the semweb library is part of the standard library in SWI-Prolog.
%load the RDF library
:- use_module(library(semweb/rdf11)).
:- use_module(library(semweb/turtle)).

%Rule to load RDF data from a file
load_rdf_data :- rdf_load('small_family.ttl', [format(turtle)]).

% Rule to check if X is a parent of Y
parent(X, Y) :- rdf_has(X, 'http://example.com/owl/families/Parent', Y).

% Rule to check if X is a person
is_person(X) :- rdf_has(X, 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.com/owl/families/Person').

% Rule to check if X is an ancestor of Y
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).


%?- parent('http://example.org/john', 'http://example.org/mary').
%?- ancestor('http://example.org/john','http://example.org/sophie').
