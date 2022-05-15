//
//  CircleView.swift
//  onBoardingApp
//
//  Created by Reenad gh on 11/10/1443 AH.
//

import SwiftUI

struct CircleView: View {
    
    @State var shapeColor : Color
    @State var shapeopasity : Double
    @State private var isAnimated : Bool = false

    var body: some View {
        ZStack{
           Circle()
                .stroke(shapeColor.opacity(shapeopasity) ,lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                 .stroke(shapeColor.opacity(shapeopasity) ,lineWidth: 80)
                 .frame(width: 260, height: 260, alignment: .center)
            
        }//ZStack
        .blur(radius: isAnimated ? 0 : 30 )
        .opacity(isAnimated ? 1 : 0)
        .scaleEffect(isAnimated ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimated)
        .onAppear(perform: {
            
            isAnimated = true
        })
        
    }
        
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack  {
            Color("BlueColor")
                .ignoresSafeArea()
            CircleView(shapeColor: .white, shapeopasity: 0.2 )

        }
    }
}
