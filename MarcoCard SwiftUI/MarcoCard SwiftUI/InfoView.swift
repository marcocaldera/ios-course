//
//  InfoView.swift
//  MarcoCard SwiftUI
//
//  Created by Marco Caldera on 08/02/22.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 40)
            .foregroundColor(.white)
            .overlay(HStack {
                Image(systemName: imageName).foregroundColor(.green)
                Text(text)
            })
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Test", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
