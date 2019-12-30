//
//  Trail.swift
//  Canyon Near Inc
//
//  Created by Trayson Keli'i on 12/19/19.
//  Copyright © 2019 Trayson Keli'i. All rights reserved.
//

import SwiftUI

struct Trail: Hashable, Codable, Identifiable {
    var id:Int
    var name:String
    var description:String
    var difficulty:Difficulty
    var state: State
    var image:String
    var coordinates: [[Double]] = []
    
    enum Difficulty: Int, CaseIterable, Codable, Hashable {
        case easy = 1
        case medium = 2
        case hard = 3
    }
    
    enum State: String, CaseIterable, Codable, Hashable {
        case Arizona = "AZ"
        case Utah = "UT"
        case Nevada = "NV"
        
    }
}
