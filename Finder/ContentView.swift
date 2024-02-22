//
//  ContentView.swift
//  Finder
//
//  Created by Sushant Suwal on 22/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn: Bool = false;
    
    let hikes = [
        Hike(name: "Sunset hike", photo: "img1", miles: 6),
        Hike(name: "Narrow passage with the building on both sides", photo: "img2", miles: 8),
        Hike(name: "Greenery micro shot", photo: "img3", miles: 10),
    ];
    
    private var backgroundColor: Color {
        isOn ? .black : .white
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
                ToggleColorView(isOn: $isOn)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundColor)
             
        }
    }
}

struct ToggleColorView: View {
    @Binding var isOn: Bool

   private var textColor: Color {
       isOn ? .white : .black
   }

    var body: some View {
        VStack {
            Image(systemName: isOn ? "lightbulb.fill" : "lightbulb")
                .font(.largeTitle)
                .foregroundColor(isOn ? .yellow : .black)
            Toggle(isOn: $isOn, label: {})
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
}
