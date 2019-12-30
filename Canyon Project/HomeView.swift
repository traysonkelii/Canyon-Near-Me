//
//  ContentView.swift
//  Canyon Near Inc
//
//  Created by Trayson Keli'i on 12/19/19.
//  Copyright © 2019 Trayson Keli'i. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    // hikes grouped by difficulty with the state as the key in the dictionary
    var categories:[String:[Trail]] {
        .init(
            grouping: trailData,
            by: {$0.state.rawValue}
        )
    }
    
    var body: some View {
        NavigationView{
            VStack() {
                Text("Canyon Project")
                    .bold()
                    .font(.title)
                
                ScrollView{
                    TrailRow( categoryName: "Arizona",trails: self.categories["AZ"]!)
                    TrailRow( categoryName: "Nevada",trails: self.categories["NV"]!)
                    TrailRow( categoryName: "Utah",trails: self.categories["UT"]!)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
