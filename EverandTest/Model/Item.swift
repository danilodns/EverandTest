//
//  Item.swift
//  EverandTest
//
//  Created by Danilo Silveira on 2024-05-13.
//

import Foundation

struct Item: Identifiable, Codable {
    enum Format: String, Codable {
        case ebook
        case audiobook
    }
    
    var id = UUID()
    let name: String
    let author: String
    let format: Format
    let average_score: Double
    let categories: [String]
    let position: Int
    let image: String
    
    init(name: String, author: String, format: Format, average_score: Double, categories: [String], position: Int, image: String) {
        self.name = name
        self.author = author
        self.format = format
        self.average_score = average_score
        self.categories = categories
        self.position = position
        self.image = image
    }
}


