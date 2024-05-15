//
//  ContentView.swift
//  EverandTest
//
//  Created by Danilo Silveira on 2024-05-09.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    
    var body: some View {
        TabView(selection:$selection) {
            Text("Home")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            TopChartsView()
                .environmentObject(TopChartViewModel())
                .tabItem {
                    Label("Top Charts", systemImage: "chart.line.uptrend.xyaxis")
                }
                .tag(1)
            Text("Search")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(2)
            Text("Saved")
                .tabItem {
                    Label("Saved", systemImage: "bookmark")
                }
                .tag(3)
            Text("Account")
                .tabItem {
                    Label("Account", systemImage: "person")
                }
                .tag(4)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
