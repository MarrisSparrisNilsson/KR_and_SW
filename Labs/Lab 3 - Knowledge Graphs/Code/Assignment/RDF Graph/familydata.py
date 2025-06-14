from rdflib import RDF, RDFS, Graph, Literal, URIRef
from rdflib.namespace import XSD, Namespace

# Create a Graph
g = Graph()

FAMILY = Namespace("http://example.com/owl/families/")
BASE = Namespace("http://example.com/rdf/family#")

# Create an RDF URI node
hakan = URIRef(BASE + "hakan")
agneta = URIRef(BASE + "agneta")
per = URIRef(BASE + "per")
martin = URIRef(BASE + "martin")
sten = URIRef(BASE + "sten")

# Mothers family
anita = URIRef(BASE + "anita")

# ---
dan = URIRef(BASE + "dan")
hampus = URIRef(BASE + "hampus")
emelie = URIRef(BASE + "emelie")

# ---
mats = URIRef(BASE + "mats")
jacob = URIRef(BASE + "jacob")
sofia = URIRef(BASE + "sofia")

# Fathers family
ingvar = URIRef(BASE + "ingvar")
stefan = URIRef(BASE + "stefan")


# Add triples using store's add() method
g.add((hakan, RDF.type, FAMILY.Person))
g.add((hakan, FAMILY.hasSpouse, agneta))
g.add((hakan, FAMILY.age, Literal("59", datatype=XSD.nonNegativeInteger)))
g.add((hakan, FAMILY.hasSibling, stefan))
g.add((hakan, FAMILY.Parent, martin))
g.add((hakan, FAMILY.Parent, per))

g.add((agneta, RDF.type, FAMILY.Person))
g.add((agneta, FAMILY.hasSpouse, hakan))
g.add((agneta, FAMILY.age, Literal("59", datatype=XSD.nonNegativeInteger)))
g.add((agneta, FAMILY.hasSibling, dan))
g.add((agneta, FAMILY.hasSibling, mats))
g.add((agneta, FAMILY.Parent, martin))
g.add((agneta, FAMILY.Parent, per))

g.add((per, RDF.type, FAMILY.Person))
g.add((per, FAMILY.hasSibling, martin))
g.add((per, FAMILY.age, Literal("22", datatype=XSD.nonNegativeInteger)))

g.add((martin, RDF.type, FAMILY.Person))
g.add((martin, FAMILY.hasSibling, per))
g.add((martin, FAMILY.age, Literal("24", datatype=XSD.nonNegativeInteger)))
g.add((martin, FAMILY.hasPet, sten))

g.add((sten, RDF.type, FAMILY.Pet))
g.add((sten, FAMILY.age, Literal("14", datatype=XSD.nonNegativeInteger)))


# Mothers family
g.add((anita, RDF.type, FAMILY.Person))
g.add((anita, FAMILY.age, Literal("87", datatype=XSD.nonNegativeInteger)))
g.add((anita, FAMILY.Parent, agneta))
g.add((anita, FAMILY.Parent, dan))
g.add((anita, FAMILY.Parent, mats))


# ---
g.add((dan, RDF.type, FAMILY.Person))
g.add((dan, FAMILY.age, Literal("54", datatype=XSD.nonNegativeInteger)))
g.add((dan, FAMILY.hasSibling, agneta))
g.add((dan, FAMILY.hasSibling, mats))
g.add((dan, FAMILY.Parent, hampus))
g.add((dan, FAMILY.Parent, emelie))

g.add((hampus, RDF.type, FAMILY.Person))
g.add((hampus, FAMILY.age, Literal("25", datatype=XSD.nonNegativeInteger)))
g.add((hampus, FAMILY.hasSibling, emelie))

g.add((emelie, RDF.type, FAMILY.Person))
g.add((emelie, FAMILY.age, Literal("24", datatype=XSD.nonNegativeInteger)))
g.add((emelie, FAMILY.hasSibling, hampus))


# ---
g.add((mats, RDF.type, FAMILY.Person))
g.add((mats, FAMILY.age, Literal("62", datatype=XSD.nonNegativeInteger)))
g.add((mats, FAMILY.hasSibling, agneta))
g.add((mats, FAMILY.hasSibling, dan))
g.add((mats, FAMILY.Parent, jacob))
g.add((mats, FAMILY.Parent, sofia))

g.add((jacob, RDF.type, FAMILY.Person))
g.add((jacob, FAMILY.age, Literal("29", datatype=XSD.nonNegativeInteger)))
g.add((jacob, FAMILY.hasSibling, sofia))

g.add((sofia, RDF.type, FAMILY.Person))
g.add((sofia, FAMILY.age, Literal("31", datatype=XSD.nonNegativeInteger)))
g.add((sofia, FAMILY.hasSibling, jacob))


# Fathers family
g.add((ingvar, RDF.type, FAMILY.Person))
g.add((ingvar, FAMILY.age, Literal("87", datatype=XSD.nonNegativeInteger)))
g.add((ingvar, FAMILY.Parent, hakan))
g.add((ingvar, FAMILY.Parent, stefan))

g.add((stefan, RDF.type, FAMILY.Person))
g.add((stefan, FAMILY.age, Literal("56", datatype=XSD.nonNegativeInteger)))
g.add((stefan, FAMILY.hasSibling, hakan))


# Iterate over triples in store and print them out.
print("--- printing raw triples ---")
for subject, predicate, object in g:
    print((subject, predicate, object), "\n")

# Bind each namespace to a prefix
g.bind("fm", FAMILY)
g.bind("", BASE)

# print all the data in the Turtle format
# print(g.serialize(destination="./myfamily.ttl"))
print(g.serialize(destination="Labs\Lab 3 - Knowledge Graphs\Code\Assignment\RDF Graph\myfamily.ttl"))
# "Labs\Lab 3 - Knowledge Graphs\Code\Assignment\RDF Graph\myfamily.ttl"
