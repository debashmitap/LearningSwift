//
//  GraphsTests.swift
//  GraphsTests
//
//  Created by Renan Greca on 13/07/2020.
//  Copyright © 2020 Renan Greca. All rights reserved.
//

import XCTest
@testable import Graphs

class GraphsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNewEmptyGraph() throws {
        let network = Graph()
        
        XCTAssertEqual(network.nodes.count, 0, "Network has \(network.nodes.count) node(s). Expected 0.")
        XCTAssertEqual(network.edges.count, 0, "Network has \(network.edges.count) edge(s). Expected 0.")
    }
    
    func testNewGraphWithNodesAndEdges() throws {
        let a = Node(label: "A")
        let b = Node(label: "B")
        let e = Edge(u: a, v: b)
        
        let nodes = [a, b]
        let edges = [e]
        
        let network = Graph(nodes: nodes, edges: edges)
        
        XCTAssertEqual(network.nodes.count, 2, "Network has \(network.nodes.count) node(s). Expected 2.")
        XCTAssertEqual(network.edges.count, 1, "Network has \(network.edges.count) edge(s). Expected 1.")
    }
    
    func testNewGraphWithLabels() throws {
        let nodes = ["A", "B", "C", "D"]
        let edges = [("A", "B"), ("B", "C"), ("C", "D")]
        
        let network = Graph(nodes: nodes, edges: edges)
        
        XCTAssertEqual(network.nodes.count, 4, "Network has \(network.nodes.count) node(s). Expected 4.")
        XCTAssertEqual(network.edges.count, 3, "Network has \(network.edges.count) edge(s). Expected 3.")

    }

    func testAddNode() throws {
        var network = Graph()
        network.addNode(label: "A")
        network.addNode(label: "B")
        
        XCTAssertEqual(network.nodes.count, 2, "Network has \(network.nodes.count) node(s). Expected 2.")
    }
    
    func testAddEdge() throws {
        var network = Graph()
        network.addNode(label: "A")
        network.addNode(label: "B")
        network.addEdge(from: "A", to: "B")
        
        XCTAssertEqual(network.edges.count, 1, "Network has \(network.edges.count) edge(s). Expected 1.")
    }
    
    func testDegree() {
        let nodes = ["A", "B", "C", "D"]
        let edges = [("A", "B"), ("A", "C"), ("C", "D")]
       
        let network = Graph(nodes: nodes, edges: edges)
        
        guard let a = network.nodes.first(where: { $0.label == "A" }) else {
            XCTFail("Required node(s) not found in graph.")
            return
        }
        
        let neighbors = network.neighbors(of: a)
        
        XCTAssertEqual(neighbors.count, 2, "Node's degree is \(neighbors.count). Expected 2.")
    }
    
    func testNeighbors() {
        let nodes = ["A", "B", "C", "D"]
        let edges = [("A", "B"), ("A", "C"), ("C", "D")]
       
        let network = Graph(nodes: nodes, edges: edges)
        
        guard   let a = network.nodes.first(where: { $0.label == "A" }),
                let b = network.nodes.first(where: { $0.label == "B" }),
                let c = network.nodes.first(where: { $0.label == "C" }) else {
            XCTFail("Required node(s) not found in graph.")
            return
        }
        
        let neighbors = network.neighbors(of: a)
        let expected = Set([b, c])
        
        XCTAssertEqual(neighbors, expected, "Node's neighbors are \(neighbors). Expected \(expected).")
    }


}
