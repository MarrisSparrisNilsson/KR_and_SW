# Answer-Set Programming (ASP)

## What is ASP?

It is used to solve difficult NP-hard search problems.

## Problems

-   Scheduling shifts and timetables
-   Planning trips and routing vehicles
-   Designing products and assembly lines
-   Diagnosing complex systems

**Radio frequency auction by the FCC** is one of the most difficult problems.

## Features of ASP

-   High level and versatile modeling language
-

Potassco Solutions have MIT licensed ASP Solvers
dlvSystems

## Problem solving with ASP

Problem -> Representation -> Output -> Solution

Problem -> Logic Program -> Solver -> Answer Set -> Solution
Problem -> Logic Program -> Grounder/Solver -> Answer Set -> Solution

**Theorem Proving**

1. Provide a representation of the problem
2. A solution is given by a derivation of a query (e.g. `Prolog`)

**Model Generation**

1. Provide a representation of the problem
2. A solution is given by a **model** of the representation (e.g. `SAT` or `ASP`)

## Answer set

-   Classical model of the logic program
-   Additionally, everything that is true must be provable

**Answer-set program**
An Answer set program is a set of rules

## Demo

Solver type: **Clingo**
Multi-threaded python friendly solver

Answers if rules are SATISFIABLE

It solves for >= 1 solutions

% Every person is living in one house

```
{ in(P,H) : house(H) } = 1 :- person(P).
```

% People do not live together

```
:- in(P,H), in(P2,H), P != P2.
```

% See binary predicate

```
# show in/2
```

## Uniform problem encoding

-   **facts** to describe a problem instance
-   **Rules** to model how solutions

## Guess and Check paradigm

-   **guess**: rules that span the search space
-   **check**: rules that prune away unwanted solution candidates

## Aggregates

Allow for forming values from groups of selected items
