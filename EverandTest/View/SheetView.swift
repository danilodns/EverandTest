//
//  SheetView.swift
//  EverandTest
//
//  Created by Danilo Silveira on 2024-05-13.
//

import SwiftUI

protocol Test {
    func test() -> String
}

struct SheetView: View {
    @State private var refresh: Bool = false
    @Binding var isPresented: Bool
    var filterProtocol: FilterProtocol
    var title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                HStack {
                    Text(title).padding(.top)
                    Spacer()
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.white)
                    }
                    
                }
                Button {
                    filterProtocol.clearSelection()
                } label: {
                    Text("Clear all")
                        .foregroundStyle(.gray)
                }
                
            }
            
            ForEach(0..<filterProtocol.numberOfItem(), id: \.self) { index in                 
                Button {
                    filterProtocol.toggleFilter(at: index)
                    self.refresh.toggle()
                } label: {
                    HStack {
                        Text(filterProtocol.itemTitle(at: index))
                        Spacer()
                        Image(systemName: filterProtocol.itemIsSelected(at: index) ? "checkmark.square" : "square")
                    }
                }.foregroundStyle(Color.primary)
            }
            Button {
                filterProtocol.confirmSelection()
                isPresented.toggle()
            } label: {
                Text("Apply")
                    .frame(maxWidth: .infinity)
            }
            .foregroundColor(.primary)
            .background(Color.secondary)
            .padding(.horizontal)
            .buttonStyle(.bordered)
        }
        .padding(.horizontal)
    }
}

