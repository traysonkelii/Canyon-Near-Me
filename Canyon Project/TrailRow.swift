//
//  TrailRow.swift
//  Canyon Near Inc
//
//  Created by Trayson Keli'i on 12/21/19.
//  Copyright © 2019 Trayson Keli'i. All rights reserved.
//

import SwiftUI

struct TrailRow: View {
    
    var categoryName:String
    var trails:[Trail]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(self.categoryName)
                .font(.title)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false)  {
                HStack(alignment: .top){
                    ForEach (self.trails, id: \.name){ trail in
                        NavigationLink(destination:
                            TrailDetail(trail: trail))
                        {
                            TrailItem(trail: trail)
                                .frame(width:300)
                                .padding(.trailing, 10)
                                .padding(.leading)
                        }
                    }
                }
            }
        }
    }
}

struct TrailRow_Previews: PreviewProvider {
    static var previews: some View {
        TrailRow(categoryName: "Hard", trails: trailData)
    }
}
