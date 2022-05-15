//
//  HomeView.swift
//  swiftUI2
//
//  Created by Reenad gh on 27/09/1443 AH.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onborarding") var isOnboraingActive : Bool = false
    @State private var isAnimated : Bool = false

    var body: some View {
        

        VStack (spacing : 20) {
            Spacer()
            
    

            // MARK - HEADER
            ZStack {
                CircleView(shapeColor: .gray , shapeopasity: 0.2)
                Image("character-2")
                
                    .resizable()
                    .scaledToFit()
                    .offset(y : isAnimated ? 35 : -35)
                    .padding()
                    .animation(
                    Animation.easeOut(duration: 4 )
                    
                        .repeatForever()
                        
                    , value: isAnimated)
            }
            
            // MARK - CENTER
            Text("Focus time is a dedicated block of time that you set aside for productive work on a task or project")
            
                .font(.title3)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding(30)
                .foregroundColor(.secondary)
            
            // MARK - FOOTER
            Spacer()
            
            Button(action : {
                
                withAnimation{
                    isOnboraingActive = true

                }
                
            }
            
            ){
                
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
            
            Text("Restart")
                    .font(.system(.title2))
                    .bold()
                    
            }//button
            
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear(perform:{
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 , execute: {
                
                isAnimated = true

            })
        })
            
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
