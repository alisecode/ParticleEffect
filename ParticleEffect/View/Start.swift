//
//  Start.swift
//  ParticleEffect
//
//  Created by Alise Serhiienko on 11.12.2023.
//

import SwiftUI

struct Start: View {
    @State private var isTapped = false
    
    var body: some View {
        VStack {
                customButton(icon: "heart.fill", color: .red, status: isTapped) {
                    withAnimation(.interactiveSpring(response: 0.6,  dampingFraction: 0.8, blendDuration: 0.8)) {
                        isTapped.toggle()
                    } completion: {
                        withAnimation(.interactiveSpring(response: 0.5,  dampingFraction: 0.8, blendDuration: 0.8)) {
                            isTapped.toggle()
                        }
                    }
                    
                }
        }
    }
    
}

extension Start {
    @ViewBuilder
    func customButton(icon: String, color: Color, status: Bool, onTap: @escaping () -> ()) -> some View {
        Image(systemName: icon)
            .font(.system(size: 64))
            .createParticle(icon: icon,
                            color: color,
                            status: status)
            .scaleEffect(status ? 1.2 : 1)
            .foregroundStyle(.red)
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
            .onTapGesture {
                onTap()
            }

        
    }
}
#Preview {
    Start()
}
