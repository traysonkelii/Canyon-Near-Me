 //
//  Data.swift
//  Canyon Near Inc
//
//  Created by Trayson Keli'i on 12/19/19.
//  Copyright © 2019 Trayson Keli'i. All rights reserved.
//

import Foundation
 
 let trailData:[Trail] = load("trailinfo.json")
 
 func load<T:Decodable>(_ filename:String, as type:T.Type = T.self) -> T {
    let data:Data
    guard let file = Bundle.main.url(forResource: filename , withExtension: nil)
        else {
            fatalError("File not found \(filename)")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Load error \(filename) error: \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) error: \(error)")
    }
 }
