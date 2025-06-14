# from SPARQLWrapper import SPARQLWrapper, JSON
# import json


# #connect to the DBpedia SPARQL endpoint
# sparql = SPARQLWrapper("https://yago-knowledge.org/sparql/query")
# sparql.setReturnFormat(JSON)

# #prepare the query
# def prequery(q):
#     sparql.setQuery(q)


# # https://yago-knowledge.org/sparql/query
# # <https://yago-knowledge.org/resource/>
# prefix = """PREFIX schema: <http://schema.org/>
#             PREFIX yago: <https://yago-knowledge.org/resource/>
#             PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
#             PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#             """

# # 1. List the people who influenced The Beatles.
# influenced_The_Beatles = prefix + """SELECT DISTINCT ?person ?label
#                         WHERE {
#                             yago:The_Beatles schema:influencedBy ?person .
#                             ?person rdfs:label ?label .
#                         }
#                         LIMIT 10
#                         """

# prequery(influenced_The_Beatles)

# # query_movie = prefix + """SELECT * WHERE {
# #                                 ?sub a schema:Movie  .
# #                             }
# #                             LIMIT 10
# #                         """

# # prequery(query_movie)


# try:
#     ret = sparql.queryAndConvert()

#     print(json.dumps(ret, indent=2))

#     for r in ret["results"]["bindings"]:
#         print(r)

# except Exception as e:
#     print(e)

# ------------------------------------------------------------

from SPARQLWrapper import JSON, SPARQLWrapper

# YAGO SPARQL endpoint
YAGO_ENDPOINT = "https://yago-knowledge.org/sparql/query"

# SPARQL query prefix
prefix = """
PREFIX schema: <http://schema.org/>
PREFIX yago: <http://yago-knowledge.org/resource/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

"""

# influenced_The_Beatles = prefix + """
# SELECT DISTINCT ?person ?label
# WHERE {
#     yago:The_Beatles schema:influencedBy ?person .
#     ?person rdfs:label ?label .
#     FILTER (lang(?label) = "en")
# }
# LIMIT 10
# """

# influenced_by_The_Beatles = prefix + """
# SELECT DISTINCT ?person ?label
# WHERE {
#     ?person ^schema:influencedBy yago:The_Beatles.
#     ?person rdfs:label ?label .
#     FILTER (lang(?label) = "en")
#     FILTER (lang(?nationality) = "en")
# }
# LIMIT 10
# """


def execute_query(query):
    sparql = SPARQLWrapper(YAGO_ENDPOINT)
    sparql.setQuery(query)
    sparql.setReturnFormat(JSON)
    try:
        results = sparql.queryAndConvert()
        return results
    except Exception as e:
        print(f"Error executing query: {e}")
        return None


def display_results(results, fields):
    if results:
        for result in results["results"]["bindings"]:
            for field in fields:
                value = result[field]["value"]
                if value == "Generic instance":
                    value = "Star on Hollywood Walk Of Fame"
                print(f"{str(field).capitalize()}: {value}")
            print("")
    else:
        print("No results found.")


queries = {
    "1: List the people who influenced The Beatles.": [
        """
        SELECT DISTINCT ?person ?label
        WHERE {
            yago:The_Beatles schema:influencedBy ?person .
            ?person rdfs:label ?label .
            FILTER (lang(?label) = "en")
        }
        """,
        ["person", "label"],
    ],
    "2: List the people influenced by The Beatles, either directly or indirectly (through a chain of influence), and show their nationality if available in the dataset.": [
        """
        SELECT DISTINCT ?name ?nationality
        WHERE {
            ?person schema:influencedBy yago:The_Beatles.
            ?person rdfs:label ?name .
            ?person schema:nationality ?from.
            ?from rdfs:label ?nationality.
            FILTER (lang(?name) = "en")
            FILTER (lang(?nationality) = "en")
        }
        """,
        ["name", "nationality"],
    ],
    "3: List the movies from 1960 to 1970 directed by people who have won the same award as The Beatles.": [
        """
        SELECT ?movie ?director (SAMPLE(?award2) AS ?award) (SAMPLE(year(?date)) AS ?year)
        WHERE {
            yago:The_Beatles schema:award ?award1 .
            ?award1 rdfs:label ?award2 .

            ?movie1 rdf:type schema:Movie .
            ?movie1 rdfs:label ?movie .
            ?movie1 schema:director ?director1 .
            ?director1 rdfs:label ?director .

            ?director1 schema:award ?dir_award .

            ?movie1 schema:dateCreated ?date .

            FILTER (lang(?director) = "en")
            FILTER (lang(?movie) = "en")
            FILTER (lang(?award2) = "en")
            FILTER (?award1 = ?dir_award)
            FILTER (year(?date) >= 1960 && year(?date) <= 1970)
        }
        GROUP BY ?movie ?director
        ORDER BY ?year
        """,
        ["movie", "director", "award", "year"],
    ],
    # Tip: use navigational graph patterns to find all the family members.
    "4: List the people who have been members of The Beatles and their family members.": [
        """
        SELECT DISTINCT ?member ?name ?gender
                    (GROUP_CONCAT(DISTINCT ?spouseName; separator=", ") AS ?spouses)
                    (GROUP_CONCAT(DISTINCT ?parentName; separator=", ") AS ?parents)
                    (GROUP_CONCAT(DISTINCT ?siblingName; separator=", ") AS ?siblings)
                    (GROUP_CONCAT(DISTINCT ?childName; separator=", ") AS ?children)
                    (GROUP_CONCAT(DISTINCT ?grandChildName; separator=", ") AS ?grandChildren)
        WHERE {
            ?member schema:memberOf yago:The_Beatles.
            ?member rdfs:label ?name .
            ?member schema:gender ?genderResource .
            ?genderResource rdfs:label ?gender .


            OPTIONAL {
                ?member schema:spouse ?spouse .
                ?spouse rdfs:label ?spouseName .
                FILTER (lang(?spouseName) = "en")
            }

            OPTIONAL {
                ?parent ^schema:children ?member .
                ?parent schema:children ?sibling .

                FILTER (?sibling != ?member)

                ?sibling rdfs:label ?siblingName .
                ?parent rdfs:label ?parentName .
                FILTER (lang(?siblingName) = "en")
                FILTER (lang(?parentName) = "en")
            }
            
            OPTIONAL {
                ?member schema:children ?child .
                ?child rdfs:label ?childName .
                FILTER (lang(?childName) = "en")
            }

            OPTIONAL {
                ?member schema:children ?child .
                ?child schema:children ?grandChild .
                ?grandChild rdfs:label ?grandChildName .
                FILTER (lang(?grandChildName) = "en")
            }


            FILTER (lang(?gender) = "en")
            FILTER (lang(?name) = "en")
        }
        GROUP BY ?member ?name ?gender
        """,
        ["member", "name", "gender", "spouses", "parents", "siblings", "children", "grandChildren"],
    ],
}

# Execute and display results for each query
for query_name, query in queries.items():
    print(f"\n--- {query_name} ---")
    results = execute_query(prefix + query[0])
    display_results(results, query[1])

# # Execute and display
# # 1. List the people who influenced The Beatles.
# results = execute_query(influenced_The_Beatles)
# display_results(results)

# # 2. List the people influenced by The Beatles, either directly or indirectly (through a chain
# #  of influence), and show their nationality if available in the dataset.
# results = execute_query(influenced_by_The_Beatles)
# display_results(results)
