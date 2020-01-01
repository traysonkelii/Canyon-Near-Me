//
//  TrailDetail.swift
//  Canyon Near Inc
//
//  Created by Trayson Keli'i on 12/22/19.
//  Copyright © 2019 Trayson Keli'i. All rights reserved.
//

import SwiftUI
import Mapbox

struct TrailDetail: View {
    
    @State var manager = CLLocationManager()
    
    var trail: Trail
    var entryTitle: String = "getting there".uppercased()
    var middleTitle: String = "the fun part".uppercased()
    var exitTitle: String = "exit".uppercased()
    var descriptionTitle: String = "description".uppercased()
    
    var body: some View {
        
        List{
            ZStack (alignment: .bottom) {
                Image(trail.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Rectangle()
                    .frame(height: 130)
                    .opacity(0.35)
                    .blur(radius: 10)
                    .foregroundColor(.black)
                HStack{
                    VStack(alignment: .leading, spacing: 8) {
                        Text(trail.name.uppercased())
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        TrailButton(trail: trail)
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    Spacer()
                }
            }
            .listRowInsets(EdgeInsets())
            VStack(alignment: .leading) {
                RouteDescription(trail: trail)
                NavigationButton(trail: trail)
                DescriptionBlockWithTitle(description: trail.description, title: descriptionTitle )
                DescriptionBlockWithTitle(description: trail.entryDescription, title: entryTitle)
                DescriptionBlockWithTitle(description: trail.middleDescription, title: middleTitle)
                DescriptionBlockWithTitle(description: trail.exitDescription, title: exitTitle)
            }
        }
    }
}

struct TrailButton : View {
    var trail: Trail
    
    var body: some View {
        NavigationLink(destination: MapView(coordinates: trail.coordinates)
            .centerCoordinate(.init(latitude: trail.coordinates[0][1], longitude: trail.coordinates[0][0]))
            .zoomLevel(16)
            .styleURL(URL(string: "mapbox://styles/mapbox/outdoors-v11")!)
        ){
            Button(action:{}){
                Text("Trail")
            }.frame(width: 100, height:25)
                .foregroundColor(Color.white)
                .font(.headline)
                .background(Color.blue)
                .cornerRadius(10)
            
        }
    }
}

struct NavigationButton : View {
    
    @State var alert = false
    var trail: Trail
    
    var body: some View {
        NavigationLink(destination: NavigationMapView(coordinates: trail.coordinates[0], trailName: trail.name)
            .alert(isPresented: $alert){
                Alert(title: Text("Please Enable Location Access In Settings"))
            })
        {
            Spacer()
            Button(action:{}){
                Text("Directions to Trail Head")
            }.frame(width: 260, height:40)
                .foregroundColor(Color.white)
                .font(.headline)
                .background(Color.blue)
            Spacer()
        }
    }
}

struct DescriptionBlockWithTitle : View {
    var description: String
    var title: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.headline)
                .padding(.vertical)
            Text(description)
                .foregroundColor(.primary)
                .font(.body)
                .lineLimit(nil)
                .lineSpacing(12)
        }
    }
}

struct RouteDescription : View {
    var trail: Trail
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Route Overview".uppercased())
                .font(.headline)
                .padding(.vertical)
            Text("Rating: \(trail.rating)")
                .font(.subheadline)
            Text("Length: \(trail.hikeLength)")
                .font(.subheadline)
            Text("Number of Rappels: \(trail.rappelNumber)")
                .font(.subheadline)
            Text("Tallest Rappel: \(trail.tallestRappel)")
                .font(.subheadline)
            Text("Gear: \(trail.gearRequired)")
                .font(.subheadline)
            Text("Special Instructions: \(trail.specialInstructionDescription)")
                .font(.subheadline)
            Text("Seasons: \(trail.seasonsAvailable.joined(separator: ", "))")
                .font(.subheadline)
            Text("Permit: \(trail.permit)")
                .font(.subheadline)
        }
    }
}

struct TrailDetail_Previews: PreviewProvider {
    static var previews: some View {
        TrailDetail(trail: trailData[1])
    }
}
