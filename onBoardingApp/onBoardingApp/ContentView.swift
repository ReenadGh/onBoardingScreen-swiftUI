//
//  ContentView.swift
//  swiftUI2
//
//  Created by Reenad gh on 25/09/1443 AH.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onborarding") var isOnboraingActive : Bool = true

    var body: some View {
      
        
        if(isOnboraingActive){
            onBoardingView()
        }else{
            HomeView()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
