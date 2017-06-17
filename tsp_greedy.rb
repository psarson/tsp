class Edge
  attr_accessor :from, :to, :weight

  def initialize(from, to, weight)
    @from, @to, @weight = from, to, weight
  end

  def <=>(other)
    self.weight <=> other.weight
  end

  def to_s
    "#{from.to_s} => #{to.to_s} with weight #{weight}"
  end
end


class Node
  attr_accessor :name, :graph, :visited

  def initialize(name)
    @name = name
    @visited = false
  end

  def adjacent_edges
    graph.edges.select{|e| e.from == self}
  end

  def to_s
    @name
  end
end


class Graph
  attr_accessor :nodes
  attr_accessor :edges

  def initialize
    @nodes = []
    @edges = []
  end

  def add_node(node)
    nodes << node
    node.graph = self
  end

  def add_edge(from, to, weight)
    edges << Edge.new(from, to, weight)
  end
end

graph = Graph.new

graph.add_node(node0 = Node.new("Node #0"))
graph.add_node(node1 = Node.new("Node #1"))
graph.add_node(node2 = Node.new("Node #2"))
graph.add_node(node3 = Node.new("Node #3"))


graph.add_edge(node0, node1, 4)
graph.add_edge(node1, node0, 4)

graph.add_edge(node0, node2, 5)
graph.add_edge(node2, node0, 5)

graph.add_edge(node2, node3, 8)
graph.add_edge(node3, node2, 8)

graph.add_edge(node1, node2, 2)
graph.add_edge(node2, node1, 2)

graph.add_edge(node0, node3, 17)
graph.add_edge(node3, node0, 17)


  #START at selected node, start_node
    #LOOP through each of start_nodes nieghbors
      #IF nieghbor_node is the smallest value && is unvisited
        #PUSH nieghbor_node to distance array
        #SET start_node.visted to true
        #SET nieghbor_node to start_node
