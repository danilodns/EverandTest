//
//  topCharts.swift
//  EverandTest
//
//  Created by Danilo Silveira on 2024-05-13.
//

import SwiftUI

struct TopChartsView: View {
    @EnvironmentObject var viewModel: TopChartViewModel
    @State private var showingFormats = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("The most popular books and audiobooks generating from  critics, NYT and more.")
                .padding(.horizontal)
            HStack(alignment: .center) {
                Button {
                    showingFormats.toggle()
                } label: {
                    HStack{
                        Text("Formats")
                            .font(.subheadline)
                        Image(systemName: "chevron.down")
                    }
                }
                .buttonStyle(.myCustonButtonStyle)
                .sheet(isPresented: $showingFormats){
                    SheetView(isPresented: $showingFormats, filterProtocol: viewModel, title: "Formats")
                        .presentationDetents([.fraction(0.3)])
                }
                Button {
                    
                } label: {
                    HStack{
                        Text("Categories")
                            .font(.subheadline)
                        Image(systemName: "chevron.down")
                    }
                }
                .buttonStyle(.myCustonButtonStyle)
                
                Button {
                    viewModel.clearSelection()
                    viewModel.confirmSelection()
                } label: {
                    Text("Clear All")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                }
                .opacity(viewModel.getSelection().isEmpty ? 0 : 1)
                .disabled(viewModel.getSelection().isEmpty)
            }.padding(.horizontal)
            List {
                ForEach(viewModel.getItemList()) { item in
                    ItemComponent(order: item.position, title: item.name, author: item.author, imageString: item.image, score: item.average_score, format: item.format)
                }
            }
            .frame(maxWidth: .infinity)
            .edgesIgnoringSafeArea(.horizontal)
            .listStyle(GroupedListStyle())
            .contentMargins(.vertical, 0)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    TopChartsView().environmentObject(TopChartViewModel())
}
