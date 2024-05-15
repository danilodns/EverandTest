//
//  StarView.swift
//  EverandTest
//
//  Created by Danilo Silveira on 2024-05-13.
//

import SwiftUI

struct StarView: View {
    var maxRating: Int
    var rating: Double
    var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        stars.overlay(
            GeometryReader { g in
                let width = rating / CGFloat(maxRating) * g.size.width
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: width)
                        .foregroundColor(.white)
                }
            }
                .mask(stars)
        )
        .foregroundColor(.gray)
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    StarView(maxRating: 5, rating: 3.5)
}
