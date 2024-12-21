//
//  Gradients.swift
//  GuessTheFlag
//
//  Created by Marko Zivanovic on 21.12.24..
//

import SwiftUI

struct Gradients: View {
    var body: some View {
        //MARK: LinearGradient
//        LinearGradient(stops: [
//            Gradient.Stop(color: .black, location: 0.45),
//            Gradient.Stop(color: .blue, location: 0.55)
//            ], startPoint: .top, endPoint: .bottom)
        
        //MARK: RadialGradient
//        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
        
        //MARK: AngularGradient
//        AngularGradient(colors: [.black, .blue,], center: .center)
        
        //MARK: .gradient
        Text("Hello world")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.blue.gradient)
    }
}

#Preview {
    Gradients()
}
