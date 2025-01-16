class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None
    
    def leaf(self):
        root = Node(self.value)
        root.left = self.left
        root.right = self.right
        return root

def print_tree(node):
    result = []
    if node:
        print(node.value)
        print_tree(node.left)
        print_tree(node.right)

#Drzewo, głębokość 3
root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left.left = Node(4)
root.left.right = Node(5)
root.right.left = Node(6)
root.right.right = Node(7)
#Drzewo, z korzeniem w liściu
tree_root = root.right
tree = tree_root.leaf()
print_tree(tree)