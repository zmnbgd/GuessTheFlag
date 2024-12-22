//
//  ButtonsAndImages.swift
//  GuessTheFlag
//
//  Created by Marko Zivanovic on 22.12.24..
//

import SwiftUI

struct ButtonsAndImages: View {
    var body: some View {
        //        Button("Delete selction", role: .destructive, action: deleteSelection)
        
        
        //        Button("Button 1") {}
        //            .buttonStyle(.bordered)
        //
        //        Button("Button 2", role: .destructive) {}
        //            .buttonStyle(.bordered)
        //
        //        Button("Button 3") {}
        //            .buttonStyle(.borderedProminent)
        //
        //        Button("Button 4", role: .destructive) {}
        //            .buttonStyle(.borderedProminent)
        
        //        Image(systemName: "pencil.circle")
        //            .foregroundColor(.blue)
        //            .font(.largeTitle)
        
        //        Button {
        //            print("Button tapped")
        //        } label: {
        //            Text("Tap me")
        //                .padding()
        //                .background(.red)
        //                .foregroundColor(.white)
        //        }
        
        //        Button("Edit", systemImage: "pencil") {
        //            print("Button tapped")
        //        }
        //    }
        
        Button {
            print("Button tapped")
        } label: {
            Label("edit", systemImage: "pencil")
                .padding()
                .foregroundColor(.white)
                .background(.red)
        }
    }
    //    func deleteSelection() {
    //        print("deleting ...")
    //    }
}


#Preview {
    ButtonsAndImages()
}
