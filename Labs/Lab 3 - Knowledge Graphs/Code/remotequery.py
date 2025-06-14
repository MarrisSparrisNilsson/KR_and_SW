#He Tan, 2024-10
#
#
from SPARQLWrapper import SPARQLWrapper, JSON


#connect to the DBpedia SPARQL endpoint
sparql = SPARQLWrapper("https://yago-knowledge.org/sparql/query")
sparql.setReturnFormat(JSON)

#prepare the query
def prequery(q):
    sparql.setQuery(q)


prefix = """PREFIX schema: <http://schema.org/>
            PREFIX yago: <http://yago-knowledge.org/resource/>
            PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
            PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
            
            """

query_movie = prefix + """SELECT * WHERE {
                        ?sub a schema:Movie  .
                   } 
                LIMIT 10"""

prequery(query_movie)

try:
    ret = sparql.queryAndConvert()

    print(ret)

    for r in ret["results"]["bindings"]:
        print(r)
        
except Exception as e:
    print(e)

