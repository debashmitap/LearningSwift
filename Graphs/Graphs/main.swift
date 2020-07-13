//
//  main.swift
//  Graphs
//
//  Created by Renan Greca on 13/07/2020.
//  Copyright © 2020 Renan Greca. All rights reserved.
//

import Foundation


var network = Graph.init(nodes:[] , edges: [])
network.addNode(label: "A")
network.addNode(label: "B")
network.addEdge(from: "A", to: "B")

