//
//  FilterData.swift
//  EverandTest
//
//  Created by Danilo Silveira on 2024-05-14.
//

import Foundation

struct FilterData: Identifiable {
    var id = UUID()
    var title: String
    var isSelected: Bool = false
}
