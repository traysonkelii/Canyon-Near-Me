//
//  Trail.swift
//  Canyon Near Inc
//
//  Created by Trayson Keli'i on 12/19/19.
//  Copyright © 2019 Trayson Keli'i. All rights reserved.
//

/**
 "entryDescription": "Entry Description",
    "middleDescription": "Middle Description",
    "exitDescription": "Exit Description",
 */

import SwiftUI

struct Trail: Hashable, Codable, Identifiable {
    var id:Int
    var name:String
    var description:String
    var difficulty:Difficulty
    var state:State
    var image:String
    var coordinates:[[Double]]
    var rating: String
    var hikeLength:String
    var rappelNumber:Int
    var tallestRappel:Int
    var seasonsAvailable:[String]
    var gearRequired:String
    var specialInstructionDescription:String
    var entryDescription:String
    var middleDescription:String
    var exitDescription:String
    var permit:String
    
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
