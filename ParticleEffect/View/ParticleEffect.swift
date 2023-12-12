//
//  ParticleEffect.swift
//  ParticleEffect
//
//  Created by Alise Serhiienko on 11.12.2023.
//

import SwiftUI

extension View {
    @ViewBuilder
    func createParticle(icon: String, color: Color, status: Bool) -> some View {
        self
            .modifier(
            ParticleModifier(status: status, icon: icon, color: color)
            )
    }
}


fileprivate struct ParticleModifier: ViewModifier {
    var status: Bool
    var icon: String
    var color: Color
    
    @State private var particles: [Particle] = []
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                ZStack {
                    ForEach(particles) { particle in
                        Image(systemName: icon)
                            .foregroundStyle(color)
                            .scaleEffect(particle.scale)
                            .offset(x: particle.randomX, y: particle.randomY)
                            .opacity(particle.opacity)
                            .opacity(status ? 1 : 0)
                            .animation(.none, value: status)
                    }
                }
                .onAppear {
                    if particles.isEmpty {
                        for _ in 1...24 {
                            let particle = Particle()
                            particles.append(particle)
                        }
                    }
                }
                .onChange(of: status) { _, newValue in
                    if !newValue {
                        for index in particles.indices {
                            particles[index].reset()
                        }
                    } else {
                        for index in particles.indices {
                            let total: CGFloat = CGFloat(particles.count)
                            let progress: CGFloat = CGFloat(index) / total
                            
                            let maxX: CGFloat = (progress > 0.46) ? 132: -132
                            let maxY: CGFloat = 64
                            
                            let randomX: CGFloat = ((progress > 0.8 ? progress - 0.8 : progress) * maxX)
                            
                            let randomY: CGFloat = ((progress > 0.8 ? progress - 0.8 : progress) * maxY) + 40
                            
                            let randomScale: CGFloat = .random(in: 0.46...1.8)
                            
                            withAnimation(.interactiveSpring(response: 0.5,  dampingFraction: 0.8, blendDuration: 0.8)) {
                                
                                let spreadX: CGFloat = (progress < 0.46 ? .random(in: 0...16) : .random(in: -16...0))
                                
                                let spreadY: CGFloat = .random(in: 0...56)
                                
                                particles[index].randomX = randomX + spreadX
                                particles[index].randomY = -randomY - spreadY
                               
                                
                            }
                            
                            withAnimation(.easeInOut(duration: 0.5)) {
                                particles[index].scale = randomScale
                                
                            }
                            
                            withAnimation(.interactiveSpring(response: 0.5,  dampingFraction: 0.8, blendDuration: 0.8).delay(0.3 + (Double(index) * 0.003))) {
                                particles[index].scale = 0.003
                            }
                            
                        }
                    }
                }
            }
    }
}

struct MyPreviewProvider_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
