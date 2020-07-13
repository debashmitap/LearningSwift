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

    func testExample() throws {
        var network = Graph()
        network.addNode(label: "A")
        network.addNode(label: "B")
        network.addEdge(from: "A", to: "B")
        
        XCTAssertEqual(network.nodes.count, 2, "Network has \(network.nodes.count) node(s). Expected 2.")
        XCTAssertEqual(network.edges.count, 1, "Network has \(network.edges.count) edge(s). Expected 1.")
    }


}
