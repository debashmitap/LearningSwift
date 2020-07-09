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

        init(label: String)
        {
            
        }
    }
    
    /// An edge that conects two nodes in our graph.
    struct Edge
    {
        
        init(u: Node, v: Node)
        {
            
        }
    }
    
    init(nodes: [Node], edges: [Edge])
    {

    }
    
    mutating func addNode(label:String) {

    }
    
    mutating func addEdge(from: String, to: String) {

    }
    
}

//: [Next](@next)
