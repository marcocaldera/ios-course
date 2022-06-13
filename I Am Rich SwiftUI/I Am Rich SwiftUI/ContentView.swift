//
//  ContentView.swift
//  I Am Rich SwiftUI
//
//  Created by Marco Caldera on 06/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .ignoresSafeArea()
            VStack {
                Text("Hello, world!")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(
                        width: 200,
                        height: 200,
                        alignment: .center
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(
            PreviewDevice(
                rawValue: "iPhone 13"
            )
        )
    }
}
