//
//  TrailDetail.swift
//  Canyon Near Inc
//
//  Created by Trayson Keli'i on 12/22/19.
//  Copyright © 2019 Trayson Keli'i. All rights reserved.
//

import SwiftUI

struct TrailDetail: View {
    
    var trail: Trail
    
    var body: some View {
        
        List{
            ZStack (alignment: .bottom) {
                Image(trail.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Rectangle()
                    .frame(height: 80)
                    .opacity(0.35)
                    .blur(radius: 10)
                HStack{
                    VStack(alignment: .leading, spacing: 8) {
                        Text(trail.name)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    Spacer()
                }
            }
            .listRowInsets(EdgeInsets())
            VStack(alignment: .leading) {
                
                Text(trail.description)
                    .foregroundColor(.primary)
                    .font(.body)
                    .lineLimit(nil)
                    .lineSpacing(12)
                
                HStack {
                    Spacer()
                    ActionButton(trail: trail)
                    Spacer()
                }.padding(.top)
            }
        }
    }
}

struct ActionButton : View {
    var trail: Trail
    var body: some View {
        NavigationLink(destination: MapView()
            .centerCoordinate(.init(latitude: trail.coordinates[0][1], longitude: trail.coordinates[0][0]))
            .zoomLevel(16)
            .styleURL(URL(string: "mapbox://styles/mapbox/outdoors-v11")!)
        ){
            Spacer()
            Button(action:{}){
                Text("Go to map")
            }.frame(width: 200, height:50)
                .foregroundColor(Color.white)
                .font(.headline)
                .background(Color.blue)
                .cornerRadius(10)
            Spacer()
        }
        
    }
}

struct TrailDetail_Previews: PreviewProvider {
    static var previews: some View {
        TrailDetail(trail: trailData[1])
    }
}
