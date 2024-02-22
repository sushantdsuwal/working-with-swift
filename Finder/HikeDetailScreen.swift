//
//  HikeDetailScreen.swift
//  Finder
//
//  Created by Sushant Suwal on 22/02/2024.
//

import SwiftUI

struct HikeDetailScreen: View {
    let hike: Hike;
    @State private var zoomed: Bool = false
    
    var body: some View {
        VStack {
            Image(hike.photo)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            Text(hike.name)
            Text("\(hike.miles.formatted()) miles")
            Spacer()
        }.navigationTitle(hike.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        HikeDetailScreen(hike: Hike(name: "Sunset View", photo: "img1", miles: 6))
    }
}
