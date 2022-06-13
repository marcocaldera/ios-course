//
//  ContentView.swift
//  H4X0R
//
//  Created by Marco Caldera on 09/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts, rowContent: { post in
                NavigationLink {
                    DetailView(url: post.url)
                } label: {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            })
                .navigationTitle("H4 Mark")
        }
        .onAppear {
            networkManager.fetchData()
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
