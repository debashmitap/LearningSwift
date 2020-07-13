//
//  Graph.swift
//  Graphs
//
//  Created by Renan Greca on 13/07/2020.
//  Copyright © 2020 Renan Greca. All rights reserved.
//

import Foundation

/// A graph data structure.
///
/// It contains a list of nodes and a list of edges.
struct Graph {
    
    /// A node in our graph.
    struct Node: Hashable {
        let label: String
    }
    
    /// An edge that conects two nodes in our graph.
    struct Edge: Hashable {
        let u: Node
        let v: Node
    }
    
    var nodes: Set<Node>
    var edges: Set<Edge>
    
    /// Initializes an empty graph.
    init() {
        self.nodes = []
        self.edges = []
    }
    
    /// Initializes a graph with arrays of Nodes and Edges.
    /// - Parameters:
    ///   - nodes: An array of Nodes
    ///   - edges: An array of Edges
    init(nodes: [Node], edges: [Edge]) {
        self.nodes = Set(nodes)
        self.edges = Set(edges)
    }
    
    /// Creates a node with the given label and adds it to the graph.
    /// - Parameter label: a label for the new node.
    mutating func addNode(label:String) {
        self.nodes.insert(Node(label: label))
    }
    
    /// Searches the graph for nodes with given labels and adds an edge
    /// - Parameters:
    ///   - from: the label of the first node of the edge
    ///   - to: the label of the second node of the edge
    mutating func addEdge(from: String, to: String) {
        let u = self.nodes.first(where: { $0.label == from })
        let v = self.nodes.first(where: { $0.label == to })
        
        if let u = u, let v = v {
            self.edges.insert(Edge(u: u, v: v))
        }
    }
    
}
