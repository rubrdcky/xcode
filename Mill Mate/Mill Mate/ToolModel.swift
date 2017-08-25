//
//  ToolModel.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/8/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import CoreData

struct Polymer {
 
    let manufacturer:String
    let partNumber:String
    let teeth:String
    let sfmRating:String
    let iptRating:String
    let material:String?
    

}

func from (dict: [String: AnyObject]) -> Tools{
    let manufacturer = dict["manufacturer"] as! String
    let partNumber = dict["partNumber"] as! String
    let teeth = dict["teeth"] as! String
    let sfmRating = dict["sfmRating"] as! String
    let iptRating = dict["iptRating"] as! String
    let material = dict["material"] as! String?
    
    return Tools (manufacturer: manufacturer,
                    partNumber: partNumber,
                    teeth: teeth,
                    sfmRating: sfmRating,
                    iptRating: iptRating,
                    material: material
                    )
}

extension Tools{
    enum noPlistError: Error{
        case noPlistFile
        case cannotReadFile
    }
    //Load all of the parts from the plist file
    static func loadFromPlist() throws -> [Polymer] {
        //First we need to find the plist
        guard let file = Bundle.main.path(forResource: "LayoutList", ofType: "plist") else {
            throw noPlistError.noPlistFile
        }
        //Then we read it as an array of dict
        guard let array = NSArray(contentsOfFile: file) as? [[String:AnyObject]] else {
            throw noPlistError.cannotReadFile
        }
        //Initialize the array
        var polymerParts: [Polymer] = []
        
        //for each dictionary
        for dict in array {
            //we implement the part
            let polymer = from(dict: dict)
            //and add it to the array
            polymerParts.append(polymer)
        }
        
        //Return all Polymer Parts
        return polymerParts
    }
    
    
}










