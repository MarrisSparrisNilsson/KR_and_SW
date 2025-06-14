# Semantic Web

## Ontology Web Language (OWL)

An Ontology is an explicit, formal specification and shared conceptualization.

-   Categorization

**Examples of Domain Ontologies**: [OBO Foundry](https://obofoundry.org/)

### Syntaxes

-   Manchester
-   Functional-Style
-   RDF
-   OWL XML

## OWL 2

-   OWL 2 DL

## Class declaration

```js
Disjoint( :Woman :Man)
```

## Class constructors

ObjectExactCardinality(3 :hasChild)

** Describe classes of individuals that are related to **

## Property Declaration

```js
ObjectPropertyDomain( :hasWife :Man)
ObjectPropertyRange( :hasWife :Woman)
```

-   (John, Mary):hasWife -> ObjectPropertyDomain( :hasWife :Man)
-   (Bill, Mary):!hasWife -> ObjectPropertyDomain( :hasWife :Woman)

## Datatype Properties

```js
Declaration(DataProperty(:hasAge))
DataPropertyDomain(:hasAge :Person)
DataPropertyRange(:hasAge xsd:nonNegativeInteger)


DataPropertyAssertion(:hasAge :John "51"^^xsd:integer)
NegativeDataPropertyAssertion(:hasAge :Jack "51"^^xsd:integer)

DatatypeDefinition(:personAge
    DatatypeRestriction(xsd:integer
        xsd:minInclusive "0"^^xsd:integer
        xsd:maxInclusive "150"^^xsd:integer
    )
)

SubclassDefinition()
```

## Keys

```js
HasKey(:Person () (:hasSSN))
HasKey(:Person () (:hasId, :hasAge))
```

## Annotation Properties

```js
AnnotationAssertion();
```

## Three Profiles of OWL DL 2

-   OWL 2 EL
-   OWL 2 QL
-   OWL 2 RL

## OWL Ontology

-   namespace

-   namespace prefix

```js
Prefix(:= <http://example.com/>)
Prefix(:= <http://example.com/>)
Prefix(:= <http://example.com/>)
Prefix(:= <http://example.com/>)
```

## Workshop

-   Ontology Development 101 (2008)
-   DiDOn (2012)

### Development Oriented

-   Specification
-   Conceptualization
-   Formalization
-   Implementation

#### Requirement Specification

-   Identify requirements

### Competence Questions (CQs)

CQs are natural language questions

#### Strategies

-   Top-Down
-   Bottom-Up

### The NeON Methodology

## Editor

-   Protégé
-   TopBraid Composer

## Ontology Quality

-   Completeness
-   Accuracy
-   Consistency
-   Conciseness
-   Clarity
-   Extendibility
-   Etc.
