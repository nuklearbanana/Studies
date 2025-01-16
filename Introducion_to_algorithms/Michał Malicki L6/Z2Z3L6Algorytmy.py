
#Zadanie 2
import random
import networkx as nx
import matplotlib.pyplot as plt

class Graph_wages:
    def __init__(self):
        self.graph = None
        self.path = None
        self.path_length = None
        
    def generate(self, number_of_elements, propability):
        G = nx.erdos_renyi_graph(number_of_elements, propability)
        self.graph = G
    
    def generate_wages(self,a,b):
        for (u,v) in self.graph.edges():
            self.graph.edges[u, v]['weight'] = random.randint(a, b)
    
    def visualisation(self):
        pos = nx.spring_layout(self.graph)
        nx.draw(self.graph, pos, with_labels=True)
        edge_labels = {(u, v): f"{d['weight']}" for (u, v, d) in self.graph.edges(data=True)}
        nx.draw_networkx_edge_labels(self.graph, pos, edge_labels=edge_labels)
        plt.show()
        
    def algorytm_dijskry(self, start, end):
        path = nx.shortest_path(self.graph,start,end, 'weight')
        length = nx.shortest_path_length(self.graph, start, end,'weight')
        self.path = path
        self.path_length = length
        
    def algorytm_kruskala(self):
        self.minimum_tree = nx.minimum_spanning_tree(self.graph, weight='weight')
        for (u, v, d) in self.minimum_tree.edges(data=True):
            print(f"({u},{v}), waga:{d['weight']}")
            
    def algorytm_prima(self):
        self.minimum_tree = nx.minimum_spanning_tree(self.graph, weight='weight',algorithm="prim")
        for (u, v, d) in self.minimum_tree.edges(data=True):
            print(f"({u},{v}), waga:{d['weight']}")
        
    def print(self):
        print(f"Najkrotsza sciezka: {self.path} ")
        print(f"Dlugosc {self.path_length}")
        
    
        


graf = Graph_wages()
graf.generate(5,0.8)
graf.generate_wages(1,10)
graf.algorytm_dijskry(0,3)
graf.visualisation()

#Zadanie 3

graf.algorytm_kruskala()
graf.algorytm_prima()

graf.print()