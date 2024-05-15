//
//  MyCustonButtonStyle.swift
//  EverandTest
//
//  Created by Danilo Silveira on 2024-05-13.
//

import SwiftUI

struct MyCustonButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal)
            .frame(height: 30)
            .foregroundStyle(.white)
            .background(
                RoundedRectangle(
                    cornerRadius: 20,
                    style: .continuous
                )
                .stroke(.white, lineWidth: 1)
            )
    }
}

extension ButtonStyle where Self == MyCustonButtonStyle {
    static var myCustonButtonStyle: Self {
        return .init()
    }
}
