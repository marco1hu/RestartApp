//
//  HomeView.swift
//  RestartApp
//
//  Created by Marco Hu on 03/12/24.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            //MARK: - HEADER
            
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
            }//: ZStack
            
            
            //MARK: - CENTER
            
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            
            //MARK: - FOOTER
            
            Spacer()
            
            Button {
                
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
                
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }//: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)

        } //:VSTACK
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
            
        }
        
    }
}

#Preview {
    HomeView()
}
