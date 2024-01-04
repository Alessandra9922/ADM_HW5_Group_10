# ADM Homework 5 - The eternal significance of publications and citations!

This repository contains code and analysis for ADM Homework 5 on dealing with citation networks, analyzing them for identifying influential works, tracking idea development, and gauging the impact of research.

## Repository Structure

The repository contains the following key files and folders:

- `main.ipynb`: Jupyter notebook containing the code and analysis for the homework, including **backend** and **frontend** part, CLQ explanation of results and AQ.

- `File generated`: Folder containing the two graphs generated from the data preprocessing, output from `main.ipynb`, including:
  - `citation_graph.csv`:  a csv file that contains the unweighted and directed graph that takes into account paper's citation relationships
  - `collaboration_graph.csv`: a csv file that contains the weighted and undirected graph that represent the collaborations of the paper's authors.
  
- `CommandLine.sh`: Bash script containing solution for command line question 

- `output_bash_script.png`: Screenshot of the outpunt given by the bash script run on the out Unix local system

## Analysis Summary

The analysis focused on:

- Constracting two graphs doing the data pre-processing
- Backend develop defining the functionalities of the system:
   - Graph's features
   - Nodes' contribution
   - Shortest ordered walk
   - Disconnecting Graph
   - Extracting Communities
- Frontend develop visualizing queries entered by the user using the functionalities provided by the backend part:
   - Visualize graph features
   - Visualize the node's contribution
   - Visualize the shortest-ordered route
   - Visualize the disconnected graph
   - Visualize the communities


The repository contains all code and output to replicate the analysis described in the homework.

## Authors: Group 10

<div style="float: left;">
    <table>
        <tr>
            <th>Student</th>
            <th>GitHub</th>
            <th>Matricola</th>
            <th>Email</th>
        </tr>
        <tr>
            <td>Habibul Bashar</td>
            <td>HabibAIUB</td>
            <td></td>
            <td>habibulbashar22@gmail.com</td>
        </tr>
        <tr>
            <td>Laura Thoft Cesario</td>
            <td>laurathoft</td>
            <td>1852596</td>
            <td>cesario.1852596@studenti.uniroma1.it</td>
        </tr>
        <tr>
            <td>Alessandra Colaiocco</td>
            <td>Alessandra9922</td>
            <td>1843714</td>
            <td>colaiocco.1843714@studenti.uniroma1.it</td>
        </tr>
        <tr>
            <td>Domenico Mangieri</td>
            <td>Domenic00git</td>
            <td>1883920</td>
            <td>mangieri.1883920@studenti.uniroma1.it</td>
        </tr>
    </table>
</div>
