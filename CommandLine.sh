#!/bin/bash

# Define the path to the citation graph CSV file
csv_citation_graph="File generated/citation_graph.csv"

# Name of python script to be executed
script_python_Q1=$(cat <<-END

import networkx as nx
import numpy as np
import pandas as pd
import csv

# read the csv_file and then create the graph to execute tasks on it
df = pd.read_csv('File generated/citation_graph.csv')
citation_graph = nx.from_pandas_edgelist(df, 'Source', 'Target', create_using=nx.DiGraph())

# Question 1: Is there any node that acts as an important connector between the different parts of the graph?

# Calculation of the betweeness centrality and the keep the node that has the max betweeness centrality score, this is our important connector
betweenness_centrality = nx.betweenness_centrality(citation_graph, normalized=True)
important_node = max(betweenness_centrality, key=betweenness_centrality.get)

# Showing the results 
print(f"Answer to the question 1: Is there any node that acts as an important 'connector' between the different parts of the graph?")
print(f"Most important connector node: {important_node}, with a score of betweeness centrality: {betweenness_centrality[important_node]}\n")

END
)

# Execution of the first python script related to the first question
python3 -c "$script_python_Q1"

# Question 2: How does the degree of citation vary among the graph nodes?

# Calculation of the in-degree and out-degree of each node to undestand how they vary among the graph and then keeping the avarage, the max and the min
# to have interesting information about the nodes and so about the citation papers
# awk is the language used, -F , sets the field separator to a comma, NR > 1 tells awk to skip the first line of the file which is the header in a csv file
# then {count[$2]++} for each line (after the header) increment a counter for the value in the second column ($2), it is this command that counts the in-degrees
# then the code to sum all in degree initializes a variable total to 0 and a variable max to 0 that will keep track of the maximum in-degree and
# initializes min to inf (infinity). Now starts a loop over all nodes in the count array that adds the in-degree of the current node to the total, 
# checks if the current node in-degree is greater than the current max: if so, it updates max, checks if the current node's in-degree is less than the current min:
# if so, it updates min, then calculates the average in-degree and prints out the calculated average, maximum, and minimum in-degrees.

# The same structure is applied to perform the out-degree statistics

echo "Answer to the question 2: How does the degree of citation vary among the graph nodes?"

echo "In-degree (citations received) statistics:"
awk -F',' 'NR > 1 {count[$2]++} END {
    total = 0
    max = 0
    min = "inf"
    for (node in count) {
        total += count[node]
        if (count[node] > max) { max = count[node] }
        if (count[node] < min) { min = count[node] }
    }
    avg = total / length(count)
    print "Average: " avg ", Max: " max ", Min: " min
}' $csv_citation_graph

# Calculate out-degree statistics
echo "Out-degree (citations made) statistics:"
awk -F',' 'NR > 1 {count[$1]++} END {
    total = 0
    max = 0
    min = "inf"
    for (node in count) {
        total += count[node]
        if (count[node] > max) { max = count[node] }
        if (count[node] < min) { min = count[node] }
    }
    avg = total / length(count)
    print "Average: " avg ", Max: " max ", Min: " min
}' $csv_citation_graph

script_python_Q3=$(cat <<-END

import networkx as nx
import numpy as np
import pandas as pd
import csv

# read the csv_file and then create the graph to execute tasks on it
df = pd.read_csv('File generated/citation_graph.csv')
citation_graph = nx.from_pandas_edgelist(df, 'Source', 'Target', create_using=nx.DiGraph())

# Question 3: What is the average length of the shortest path among nodes?

# Calculating the average shortest path length for each strongly connected component separately, in this way each component is treated as an isolated graph
# at the end the stats about the average langht are reported giving insight into the internal structure of the connected portions of graph

# Function to calculate average shortest path length for each component
def component_avg_shortest_path_length(component, graph):
    # consider only components with at least 2 node otherwise is not meaningful talking about path
    if len(component) > 1:
        subgraph = graph.subgraph(component)
        return nx.average_shortest_path_length(subgraph)
    # base case of a single node components
    else:
        return 0

# Calculate the average shortest path length for each strongly connected component (scc)
scc_avg_path_lengths = [component_avg_shortest_path_length(c, citation_graph) for c in nx.strongly_connected_components(citation_graph)]
scc_avg_path_lengths = [length for length in scc_avg_path_lengths if length > 0]

# Statistics about lenght
average_of_averages = sum(scc_avg_path_lengths)/len(scc_avg_path_lengths) if scc_avg_path_lengths else 0
max_average_length = max(scc_avg_path_lengths, default=0)
min_average_length = min(scc_avg_path_lengths, default=0)

# Showing the results
print(f"\nAnswer to the question 3: What is the average length of the shortest path among nodes?")
print(f"Average of averages: {average_of_averages}")
print(f"Max average path length: {max_average_length}")
print(f"Min average path length: {min_average_length}")
print(f"Number of components with paths: {len(scc_avg_path_lengths)}")
END
)

# Execute the python script
python3 -c "$script_python_Q3"
