%He Tan, 2024-10
%
%
%the semweb library is part of the standard library in SWI-Prolog.
%load the RDF library
:- use_module(library(semweb/rdf11)).
:- use_module(library(semweb/turtle)).

%Rule to load RDF data from a file
load_rdf_data :- rdf_load('../RDF Graph/myfamily.ttl', [format(turtle)]).
% load_rdf_data :- rdf_load('Labs/Lab 3 - Knowledge Graphs/Code/Assignment/RDF Graph/myfamily.ttl', [format(turtle)]).
% Load data when file is this file is loaded.
:- load_rdf_data.


% Rule to check if X is a parent of Y
parent(X, Y) :- rdf_has(X, 'http://example.com/owl/families/Parent', Y).
sibling(X, Y) :- rdf_has(X, 'http://example.com/owl/families/hasSibling', Y).
has_spouse(X, Y) :- rdf_has(X, 'http://example.com/owl/families/hasSpouse', Y).
has_pet(X, Y) :- rdf_has(X, 'http://example.com/owl/families/hasPet', Y).

% Rule to check if X is a person
is_person(X) :- rdf_has(X, 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.com/owl/families/Person').
is_pet(X) :- rdf_has(X, 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type', 'http://example.com/owl/families/Pet').

all_persons(Persons) :-
    findall(Person, is_person(Person), PersonList),
    list_to_set(PersonList, Persons).

all_person_siblings(Person, Siblings) :-
    findall(Sibling, sibling(Person, Sibling), SiblingList),
    list_to_set(SiblingList, Siblings).
% Rule to check if X is an ancestor of Y
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).


% ---------------------------Original----------------------------------
% ?- load_rdf_data.
% ?- rdf(S, P, O).
% ?- parent('http://example.org/john', 'http://example.org/mary').
% ?- ancestor('http://example.org/john','http://example.org/sophie').
% ---------------------------Original----------------------------------

% Warning: Providing two persons that are not ancestors will result in infinite loop.
gen_distance(Person1, Person2, 1) :- parent(Person1, Person2).
gen_distance(Person1, Person2, N) :-
    parent(Person1, Z),
    gen_distance(Z, Person2, N1),
    N is N1 + 1.
gen_distance(Person1, Person2, N) :-
    gen_distance(Person2, Person1, N).


grandparent(GParent, GChild) :-
    parent(GParent, Parent),
    parent(Parent, GChild).


cousin(C1, C2) :-
    parent(P1, C1),
    parent(P2, C2),
    sibling(P1, P2).


all_ancestors(Person, Ancestors) :-
    findall(Ancestor, ancestor(Ancestor, Person), AncestorsResults),
    list_to_set(AncestorsResults, Ancestors).


% List all persons and their children
list_persons_with_children :-
    is_person(Person),
    rdf_global_id(ShortName, Person),
    format('Person: ~w~n', [ShortName]),
    (
        parent(Person, Child),
        rdf_global_id(ChildName, Child),
        format('  Child: ~w~n', [ChildName]),
        fail
    ;
        nl  % Print a newline between persons
    ),
    fail.
list_persons_with_children.



% ================================ Reasoning examples for my family: ================================
% list_persons_with_children. ---------> Get all persons and children relations


% 1.
% all_ancestors('http://example.com/rdf/family#martin', Ancestors).

% 2.
% gen_distance('http://example.com/rdf/family#anita', 'http://example.com/rdf/family#martin', Gen_Distance).
% gen_distance('http://example.com/rdf/family#martin', 'http://example.com/rdf/family#anita', Gen_Distance).
% gen_distance('http://example.com/rdf/family#hakan', 'http://example.com/rdf/family#martin', Gen_Distance).


% 3. (Other fun stuff)
% findall(Cousin, cousin('http://example.com/rdf/family#martin', Cousin), Cousins).

% is_pet(X).

% grandparent(GParent, 'http://example.com/rdf/family#martin').

% all_person_siblings('http://example.com/rdf/family#martin', Siblings).
% all_person_siblings('http://example.com/rdf/family#agneta', Siblings).
% all_person_siblings('http://example.com/rdf/family#hakan', Siblings).

% ================================ Reasoning examples for my family: ================================
