import random
import networkx as nx
import matplotlib.pyplot as plt

class Graph:
    def __init__(self):
        self.relations = {}
        self.nodes = set()
        self.components_dic = {}
        self.path = None
        
    def random_graph(self,n,random_sample):
        a = {}
        b = []
        for i in range(n):
            a[i] = set()
            b.append(i)
            
        for i in range(n):
            for j in range(n):
                if random.random() < random_sample:
                    a[i].add(j)
                    a[j].add(i) 
        self.relations = a
        self.nodes = b
        
    def find_components(self):
        visited = set()
        components = []
        for node in self.relations:
            if node not in visited:
                component = self.bfs(node, visited)
                components.append(component)
        
        for i in range(len(components)):
            self.components_dic[i] = components[i]
    
    def bfs(self, start, visited):
        component = set()
        queue = [start]

        while queue:
            node = queue.pop(0)
            if node not in visited:
                visited.add(node)
                component.add(node)
                queue.extend(self.relations[node] - visited)

        return component
    
    def print_graph(self):
        print(f"Relacje: {self.relations}") 
        print(f"Skladowe: {self.components_dic}")    
        print(f"Najkrotsza sciezka: {self.path}")  
        # print(f"Wierzcholki: {self.nodes}")    
        
    def visualization(self):
        G = nx.Graph()
        for node, connections in self.relations.items():
            for connection in connections:
                G.add_edge(node, connection)
        pos = nx.spring_layout(G)
        nx.draw(G, pos, with_labels=True)
        plt.show()
        
    def shortest_path(self, node_a, node_b):
        if (node_a and node_b) in self.nodes:
            items = self.components_dic.items()
            for i in items:
                if node_a in i[1]:
                    a = i[0] 
                if node_b in i[1]:
                    b = i[0]
            if a == b:
                visited = set()
                queue = [(node_a, [node_a])]  
                while queue:
                    current_node, path = queue.pop(0)
                    if current_node == node_b:
                        self.path = path
                        return 
                    if current_node not in visited:
                        visited.add(current_node)
                        for neighbor in self.relations[current_node]:
                            queue.append((neighbor, path + [neighbor])) 
                self.path = "Nie istnieje"
            else:
                self.path = "Nie istnieje"
        else:
            self.path = "Nie istnieje"
        

    
graph = Graph()
graph.random_graph(20,0.05) 
graph.find_components()
graph.shortest_path(5,8) 
graph.print_graph()
graph.visualization()
