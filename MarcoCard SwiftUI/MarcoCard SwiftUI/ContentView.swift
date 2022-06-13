//
//  ContentView.swift
//  MarcoCard SwiftUI
//
//  Created by Marco Caldera on 08/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(
                red: 0.09,
                green: 0.63,
                blue: 0.52,
                opacity: 1.00
            )
                .ignoresSafeArea()
            VStack {
                Image("test")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(
                        alignment: .center
                    )
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Marco Caldera")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("Staff Software Engineer")
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
                Divider()
                InfoView(text: "+39 3400826831", imageName: "phone.fill")
                InfoView(text: "marco.caldera93@icloud.com", imageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
