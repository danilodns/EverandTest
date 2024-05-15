//
//  File.swift
//  EverandTest
//
//  Created by Danilo Silveira on 2024-05-13.
//

import SwiftUI

protocol FilterProtocol {
    func toggleFilter(at index: Int)
    func itemIsSelected(at index: Int) -> Bool
    func itemTitle(at index: Int) -> String
    func refreshSelection()
    func confirmSelection()
    func numberOfItem() -> Int
    func clearSelection()
}

class TopChartViewModel: ObservableObject, FilterProtocol {
    private var data: [FilterData] = [FilterData(title: "ebook"), FilterData(title: "audiobook")]
    private var itemList: [Item] = []
    @Published var selectionConfirmed = [FilterData]()
    @Published var selection = [FilterData]()
    
    
    init() {
        do {
            guard let path = Bundle.main.path(forResource: "DataBook", ofType: "json"), let pathURL = try String(contentsOfFile: path).data(using: .utf8) else {
                return
            }
            let dataBookJson = try JSONDecoder().decode([Item].self, from: pathURL)
            self.itemList = dataBookJson
        } catch {
            print(error.localizedDescription)
            return
        }
    }
    
    func getItemList() -> [Item] {
        if !getSelection().isEmpty {
            return itemList.filter({ getSelection().contains($0.format.rawValue)}).sorted(by: { $0.position < $1.position})
        } else {
            return itemList.sorted(by: { $0.position < $1.position})
        }
    }
    
    func toggleFilter(at index: Int) {
        guard index >= 0 && index < data.count else {
            return
        }
        
        data[index].isSelected.toggle()
        refreshSelection()
    }
    
    func itemIsSelected(at index: Int) -> Bool {
        guard index >= 0 && index < data.count else {
            return false
        }
        return data[index].isSelected
    }
    
    func itemTitle(at index: Int) -> String {
        guard index >= 0 && index < data.count else {
            return ""
        }
        return data[index].title.capitalized
    }
    
    func clearSelection() {
        for index in 0..<data.count {
            data[index].isSelected = false
        }
        refreshSelection()
    }
    
    func numberOfItem() -> Int {
        data.count
    }
    
    func getSelection() -> [String] {
        selectionConfirmed.map({$0.title})
    }
    
    func refreshSelection() {
        let result = data.filter{ $0.isSelected }
        withAnimation {
            selection = result
        }
    }
    
    func confirmSelection() {
        selectionConfirmed = selection
    }
}
