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
    
    /// The set of nodes in the graph.
    var nodes: Set<Node> = []
    
    /// The set of edges in the graph.
    var edges: Set<Edge> = []
    
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
    
    /// Initializes a graph with arrays of labels.
    /// - Parameters:
    ///   - nodes: An array of labels of nodes
    ///   - edges: An array of pairs of labels of nodes
    init(nodes: [String], edges: [(String, String)]) {
        // TODO: implement this initializer
        // Tips: use the addNode and addEdge methods
        
    }
}

/// A node in our graph.
struct Node: Hashable {
    /// A unique string that identifies this node
    let label: String
}

/// An edge that conects two nodes in our graph.
struct Edge: Hashable {
    let u: Node
    let v: Node
}

// MARK: - Node-related functions
extension Graph {
    /// Creates a node with the given label and adds it to the graph.
    /// - Parameter label: a label for the new node.
    mutating func addNode(label: String) {
        self.nodes.insert(Node(label: label))
    }
    
    /// Creates a node with the given label and adds it to the graph.
    /// - Parameter label: a label for the new node.
    mutating func addNode(node: Node) {
        self.nodes.insert(node)
    }
    
    /// Finds the neighbors of a given node.
    /// - Parameter node: the origin node.
    /// - Returns: a set of nodes that share an edge with the given node.
    func neighbors(of node: Node) -> Set<Node> {
        var result:Set<Node> = []
        
        // TODO: find the neighbors and put them in result.
        return result
    }
    
}

// MARK: - Edge-related functions
extension Graph {
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
    
    /// Searches the graph for the given nodes and adds an edge between them
    /// - Parameters:
    ///   - from: the first node of the edge
    ///   - to: the second node of the edge
    mutating func addEdge(from: Node, to: Node) {
        var u = self.nodes.first { $0.label == from.label }
        var v = self.nodes.first { $0.label == to.label }
        
        if let u = u, let v = v {
            self.edges.insert(Edge(u: u, v: v))
        }

    }
}
