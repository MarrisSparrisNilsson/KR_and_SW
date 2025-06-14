#He Tan, 2024-10
#
from rdflib import Graph, Literal, RDF, URIRef
from rdflib.namespace import Namespace, XSD

FAMILY = Namespace("http://example.com/owl/families/")
BASE = Namespace("http://example.com/rdf/family#")

# Create a Graph
g = Graph()

#Create an RDF URI node 
bill = URIRef(BASE + "bill")
mary = URIRef(BASE + "mary")

# Add triples using store's add() method
g.add((bill, RDF.type, FAMILY.Person))
g.add((bill, FAMILY.hasWife, mary))
g.add((bill, FAMILY.age, Literal("32", datatype=XSD.nonNegativeInteger)))

# Iterate over triples in store and print them out.
print("--- printing raw triples ---")
for s, p, o in g:
    print((s, p, o))

# Bind each namespace to a prefix 
g.bind("fm", FAMILY)
g.bind("", BASE)

# print all the data in the Turtl format
print(g.serialize(destination="myfamily.ttl"))