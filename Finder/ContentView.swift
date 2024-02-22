//
//  ContentView.swift
//  Finder
//
//  Created by Sushant Suwal on 22/02/2024.
//

import SwiftUI


class AppState: ObservableObject {
    @Published var isOn: Bool = false
}


struct ContentView: View {
   
    @EnvironmentObject private var appState: AppState;
    
    let hikes = [
        Hike(name: "Sunset hike", photo: "img1", miles: 6),
        Hike(name: "Narrow passage with the building on both sides", photo: "img2", miles: 8),
        Hike(name: "Greenery micro shot", photo: "img3", miles: 10),
    ];
    
    private var backgroundColor: Color {
        appState.isOn ? .black : .white
   }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(hikes) { hike in
                    NavigationLink(value: hike) {
                        HikeCellView(hike: hike)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Hikes")
                .navigationDestination(for: Hike.self) { hike in
                    HikeDetailScreen(hike: hike)
                }
                ToggleColorView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundColor)
             
        }
    }
}

struct ToggleColorView: View {
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        VStack {
            Image(systemName: appState.isOn ? "lightbulb.fill" : "lightbulb")
                .font(.largeTitle)
                .foregroundColor(appState.isOn ? .yellow : .black)
            Toggle(isOn: $appState.isOn, label: {})
            .fixedSize()
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
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

#Preview {
    ContentView()
        .environmentObject(AppState())
}
