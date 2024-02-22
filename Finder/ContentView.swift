//
//  ContentView.swift
//  Finder
//
//  Created by Sushant Suwal on 22/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    let hikes = [
        Hike(name: "Sunset hike", photo: "img1", miles: 6),
        Hike(name: "Narrow passage with the building on both sides", photo: "img2", miles: 8),
        Hike(name: "Greenery micro shot", photo: "img3", miles: 10),
    ];
    
    var body: some View {
        NavigationStack {
            List(hikes)  { hike in
                NavigationLink(value: hike) {
                    HikeCellView(hike: hike)
                }
            }.navigationTitle("Hikes")
                .navigationDestination(for: Hike.self) { hike in
                    HikeDetailScreen(hike: hike)
                }
        }
    }
}

#Preview {
    ContentView()
}

struct HikeCellView: View {
    let hike: Hike

    var body: some View {
        HStack(alignment: .top) {
            Image(hike.photo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading) {
                Text(hike.name)
                Text("\(hike.miles.formatted()) miles")
            }
        }
    }
}
