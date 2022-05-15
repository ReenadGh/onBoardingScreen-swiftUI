//
//  onBoardingView.swift
//  swiftUI2
//
//  Created by Reenad gh on 27/09/1443 AH.
//

import SwiftUI

struct onBoardingView: View {
    
    @AppStorage("onborarding") var isOnboraingActive : Bool = true
    @State private var buttonWidth = UIScreen.main.bounds.width - 70
    @State private var buttonoffect: CGFloat = 0
    @State private var isAnimated : Bool = false
    @State private var imgOffecet : CGSize = .zero
    @State private var textTitle : String = "Share."
    
    var body: some View {
        ZStack {
            //  MARK: - Header
            
            Color("BlueColor")
                .ignoresSafeArea(.all , edges: .all)
            VStack (spacing : 20 ) {
                
                
                Spacer()
                
                VStack (spacing: 2){
                    Text(textTitle)
                        .font(.system(size:60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .id(textTitle)
                    
                    
                    Text("""
it's not how much we give but
how much love we put into giving
""")
                        .font(.title2)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal , 10)
                }//vstack - Header
                
                .opacity(isAnimated ? 1: 0 )
                .offset(y : isAnimated ? 0 : -40 )
                .animation(.easeIn(duration: 1), value: isAnimated)
                
                //  MARK: - Body
                
                ZStack{
                    CircleView(shapeColor: .white , shapeopasity: 0.2 )
                        .offset(x: imgOffecet.width * -1)
                        .blur(radius: abs(imgOffecet.width / 5 ))
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimated ? 1 : 0 )
                        .animation(.easeIn(duration: 0.5), value: isAnimated)
                        .offset(x: imgOffecet.width , y: 0)
                        .rotationEffect(.degrees(imgOffecet.width/10 ))
                        .gesture(
                            DragGesture()
                                .onChanged{
                                    gesture in
                                    if abs(imgOffecet.width) <= 150 {
                                        imgOffecet = gesture.translation
                                        
                                        withAnimation( .easeOut(duration: 0.2 )){
                                            textTitle = "Give."
                                        }
                                    }
                                }
                                .onEnded{
                                    gesture in
                                    
                                    imgOffecet = .zero
                                    
                                    withAnimation(.easeOut(duration: 0.2)){
                                        textTitle = "Share."
                                    }
                                }
                        )
                        .animation(.easeOut(duration: 1), value:imgOffecet )
                    
                }//ZStack - Body
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .foregroundColor(.white)
                        .blur(radius: abs(imgOffecet.width / 20))
                        .opacity(isAnimated ? 1 : 0 )
                        .animation(.easeIn(duration: 0.5).delay(2), value: isAnimated)
                        .font(.system(size: 40 ))
                        .offset(y: 10 )
                    ,alignment: .bottom
                    
                )
                Spacer()
                
                //  MARK: - slide button
                
                ZStack{
                    
                    
                    Capsule()
                        .foregroundColor(.white.opacity(0.2))
                    Capsule()
                        .foregroundColor(.white.opacity(0.2))
                        .padding(10)
                    
                    Text("Get Strarted !")
                        .foregroundColor(.white)
                        .font(.title2 .bold())
                        .offset(x: 25)
                    
                    
                    HStack{
                        Capsule()
                            .fill(Color("PinkColor"))
                            .frame(width : buttonoffect + 100 )
                        Spacer()
                        
                    }
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("PinkColor"))
                            Circle()
                                .fill(.black.opacity(0.2))
                                .padding(10)
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 27) .bold())
                            
                        }
                        .frame(width:100 , height: 100, alignment: .center)
                        .foregroundColor(.white)
                        .offset(x: buttonoffect )
                        .gesture(
                            DragGesture()
                                .onChanged {gesture in
                                    if gesture.translation.width > 0  && buttonoffect <= buttonWidth - 100 {
                                        
                                        buttonoffect = gesture.translation.width
                                    }
                                    
                                    
                                }
                                .onEnded{gesture in
                                    
                                    withAnimation(
                                        Animation.easeOut(duration: 0.5)
                                    ){
                                        
                                        if (buttonoffect >= buttonWidth / 2 ){
                                            buttonoffect = buttonWidth
                                            isOnboraingActive = false
                                            
                                        }else{
                                            buttonoffect = 0
                                        }
                                        
                                    }
                                    
                                    
                                    
                                    
                                }
                        )
                        
                        
                        
                        Spacer()
                        
                        
                    }
                    
                    
                }
                .frame(width: buttonWidth ,height: 100, alignment: .center)
                .padding()
                .opacity(isAnimated ? 1: 0 )
                .offset(y : isAnimated ? 0 : 40 )
                .animation(.easeIn(duration: 1), value: isAnimated)
                
                
                
                // Mark - Footer
                
            }//VStack
        }//ZStack
        .onAppear(perform: {
            
            isAnimated = true
        })
        
        
    }
}

struct onBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        onBoardingView()
    }
}
