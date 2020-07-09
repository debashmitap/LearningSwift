//: [Previous](@previous)

import Foundation

/*
 Assignment 5: Starting a graph
 
 For this assignment, we'll start building a graph data structure.
 
 You need to implement three structs:
 Node, Edge and Graph, with the methods and properties indicated.
 
 Node:
 - a `label` property of type String.
 - an initializer that receives the label.
 
 Edge:
 - a `u` property of type Node.
 - a `v` property of type Node.
 - an initializer that receives two Nodes.
 
 Graph:
 - a `nodes` property of type [Node].
 - an`edges` property of type [Edge].
 - an initializer that receives an array of Nodes and an array of Edges.
 - an `addNode(label:)` method that adds a node to the graph.
 - an `addEdge(from:, to:)` method that receives two labels
 and adds an edge connecting the two corresponding nodes.
 
 */

/// A graph data structure.
///
/// It contains a list of nodes and a list of edges.
struct Graph {
    
    /// A node in our graph.
    struct Node
    {
        var label:String
        
        init(label: String)
        {
            self.label = label
        }
    }
    
    /// An edge that conects two nodes in our graph.
    struct Edge
    {
        var node1: Node
        var node2: Node
        
        init(u: Node, v: Node)
        {
            node1 = u
            node2 = v
        }
    }
    
    var arrofnod: [Node]
    var arrofedg: [Edge]
    
    init(nodes: [Node], edges: [Edge])
    {
        arrofnod = nodes
        arrofedg = edges
    }
    
    mutating func addNode(label:String)
    {
        arrofnod.append(Node(label: label))
    }
    
    mutating func addEdge(from: String, to: String)
    {
        var node1:Node?
        var node2:Node?
        
        for i in arrofnod
        {
            if ((from == i.label))
            {
                node1 = i
            }
            if ((to == i.label))
            {
                node2 = i
            }
        }
        
        if  let node1 = node1,
            let node2 = node2
        {
            arrofedg.append(Edge(u: node1, v: node2))
        }
    }
    
}

var network = Graph.init(nodes:[] , edges: [])
network.addNode(label: "A")
network.addNode(label: "B")
network.addEdge(from: "A", to: "B")
network.arrofnod
network.arrofedg

//: [Next](@next)
