class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left.left = Node(4)
root.left.right = Node(5)
root.left.left.left = Node(6)
root.left.left.right = Node(7)
lisc = root.right

#Drzewo
#        1
#       / \
#      2   3
#     / \  
#    4   5 
#   / \  
#  6   7

def rysowanie(node):
    if node is None:
        return
    print(node.value, end='')
    if node.left or node.right:
        print('(', end='')
        rysowanie(node.left)
        print(',', end='')
        rysowanie(node.right)
        print(')', end='')

rysowanie(root)
print('')

def analiza(node):
    level = 1
    list = [node]
    wezly=[]
    ile_w = []
    leaf_level = []
    leaf = []
    while list:
        if len(list) == 2:
            ile_w.append([level,len(wezly)])
            wezly=[]
            level+=1
        current = list.pop(0)
        if current.left:
            list.append(current.left)
        if current.right:
            list.append(current.right)
        if current.left and current.right:
            wezly.append([level,current.value])
        else:
            if current.value not in leaf:
                leaf.append(current.value)
                leaf_level.append(level)
           
    return ile_w,leaf,leaf_level
liscie = analiza(root)[1]
liscie_poziomy = analiza(root)[2]
ilosc_wezlow = analiza(root)[0]

ile_l = []
for level in range(len(liscie)):
    ile_l.append([level+1,liscie_poziomy.count(level+1)])  

print(f"wartosc po lewej to numer poziomu, wartosc po prawej to ilosc wezlow: {ilosc_wezlow}")
print(f"wartosc po lewej to numer poziomu, wartosc po prawej to ilosc lisci: {ile_l}")

def shortest_path(root):
    pack = [(root, [root.value])]
    shortest_path = None
    shortest_length = float('inf')

    while pack:
        current, path = pack.pop(0)
        if current.left is None and current.right is None:
            if len(path) < shortest_length: 
                shortest_path = path
                shortest_length = len(path)
        if current.left:
            pack.append((current.left, path + [current.left.value]))  
        if current.right:
            pack.append((current.right, path + [current.right.value]))  
    
    return shortest_path

l = []
for i in range(len(liscie)):
    if liscie_poziomy[i] == 2:
        l.append(liscie[i])
print(f"Najkrotsza sciezka: {shortest_path(root)}, wszytkie liscie na tym poziomie: {l} ")
