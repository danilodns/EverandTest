//
//  ItemComponent.swift
//  EverandTest
//
//  Created by Danilo Silveira on 2024-05-13.
//

import SwiftUI

struct ItemComponent: View {
    var order: Int
    var title: String
    var author: String
    var imageString: String
    var score: Double
    var format: Item.Format
    
    var body: some View {
        HStack(alignment: .top) {
            Text("\(order).")
            AsyncImage(url: URL(string: imageString)) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "questionmark.square").resizable()
            }.overlay {
                if format == .audiobook {
                    Image(systemName: "headphones.circle.fill")
                        .offset(x: 15, y:15)
                }
            }
            .frame(width: 60, height: 60)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack{
                    Text(title)
                    Spacer()
                    Image(systemName: "bookmark")
                }
                Text(author)
                    .font(.subheadline)
                StarView(maxRating: 5, rating: score)
                    .frame(width: 80, height: 15)
            }
        }
        
    }
}

#Preview {
    ItemComponent(order: 1, title: "Hello World", author: "Author 1", imageString: "https://m.media-amazon.com/images/I/91YXaY-I9VS._SL1500_.jpg", score: 3.4, format: .audiobook)
}
