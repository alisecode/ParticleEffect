//
//  ContentView.swift
//  ParticleEffect
//
//  Created by Alise Serhiienko on 11.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.systemBackground
                .ignoresSafeArea()
            
            VStack {
                Start()
                
                HStack(spacing: 0) {
                    Text("Love")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.gray)
                    Text("It")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
