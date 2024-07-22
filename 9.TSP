from itertools import permutations

def calculate_distance(graph, path):
    distance = 0
    for i in range(len(path) - 1):
        distance += graph[path[i]][path[i + 1]]
    distance += graph[path[-1]][path[0]] 
    return distance

def travelling_salesman(graph, start):
    vertices = list(graph.keys())
    vertices.remove(start)
    
    min_path = None
    min_distance = float('inf')
    
    for perm in permutations(vertices):
        current_path = [start] + list(perm) + [start]
        current_distance = calculate_distance(graph, current_path)
        
        if current_distance < min_distance:
            min_distance = current_distance
            min_path = current_path
    
    return min_path, min_distance
graph = {
    'A': {'A': 0, 'B': 10, 'C': 15, 'D': 20},
    'B': {'A': 10, 'B': 0, 'C': 35, 'D': 25},
    'C': {'A': 15, 'B': 35, 'C': 0, 'D': 30},
    'D': {'A': 20, 'B': 25, 'C': 30, 'D': 0}
}

start = 'A'
path, distance = travelling_salesman(graph, start)

print(f"The optimal path is: {' -> '.join(path)} with a total distance of {distance}")
