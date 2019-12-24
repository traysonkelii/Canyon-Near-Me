//
//  TrailItem.swift
//  Canyon Near Inc
//
//  Created by Trayson Keli'i on 12/20/19.
//  Copyright © 2019 Trayson Keli'i. All rights reserved.
//

import SwiftUI

struct TrailItem: View {
    
    var trail:Trail
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Image(trail.image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 170)
                .cornerRadius(10)
                .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 5.0){
                Text(trail.name)
                    .foregroundColor(.primary)
                    .font(.headline)
                
                Text(trail.description)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(height: 40)
            }
        }
    }
}

struct TrailItem_Previews: PreviewProvider {
    static var previews: some View {
        TrailItem(trail: trailData[0])
    }
}
