//
//  HikeDetailScreen.swift
//  Finder
//
//  Created by Sushant Suwal on 22/02/2024.
//

import SwiftUI

struct HikeDetailScreen: View {
    @EnvironmentObject private var appState: AppState;

    let hike: Hike;
    @State private var zoomed: Bool = false
    
    private var backgroundColor: Color {
        appState.isOn ? .black : .white
   }
    
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
           
        }.navigationTitle(hike.name)
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundColor)
        
    }
}

#Preview {
    NavigationStack{
        HikeDetailScreen(hike: Hike(name: "Sunset View", photo: "img1", miles: 6))
    }
    .environmentObject(AppState())
}
