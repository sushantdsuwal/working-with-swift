//
//  Hike.swift
//  Finder
//
//  Created by Sushant Suwal on 22/02/2024.
//

import Foundation

struct Hike: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let photo: String
    let miles: Double
}
