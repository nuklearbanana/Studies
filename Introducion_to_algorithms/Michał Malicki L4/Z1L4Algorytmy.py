class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

def search_one(root): # wszerz
    if root is None:
        return []
    
    result = []
    list = [root]

    while list:
        current = list.pop(0)
        result.append(current.value)

        if current.left:
            list.append(current.left)

        if current.right:
            list.append(current.right)
    return result

def search_two(root): # wgłąb
    if root is None:
        return []
    
    result = []
    list = [root]
    while list:
        current = list.pop()
        result.append(current.value)
        if current.right:
            list.append(current.right)
        if current.left:
            list.append(current.left)
    return result

#Drzewo, głębokość 3
root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left.left = Node(4)
root.left.right = Node(5)
root.right.left = Node(6)
root.right.right = Node(7)

print(search_one(root))
print(search_two(root))