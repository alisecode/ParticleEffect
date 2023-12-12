//
//  ParticleModel.swift
//  ParticleEffect
//
//  Created by Alise Serhiienko on 11.12.2023.
//

import SwiftUI

struct Particle: Identifiable {
    var id = UUID()
    var opacity: CGFloat = 1
    
    var scale: CGFloat = 1
    var randomX: CGFloat = 0
    var randomY: CGFloat = 0
    
    mutating func reset() {
         scale = 0
         opacity = 1
         randomX = 0
         randomY = 0
    }
    
}
