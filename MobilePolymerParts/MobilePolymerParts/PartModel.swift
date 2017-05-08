//
//  PartModel.swift
//  MobilePolymerParts
//
//  Created by Jacob Warren on 3/29/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import CoreData

struct Polymer {
 
    let workcenter:String
    let partNumber:String
    let layout:String
    let collection:String
    let secondPart:String?
    let secondLayout:String?
    let thirdPart:String?
    let thirdLayout:String?
    

}

//var polymerStruct = Polymer()

//Create Polymer Parts corresponding to the given dict

func from (dict: [String: AnyObject]) -> Polymer{
    let workcenter = dict["workcenter"] as! String
    let partNumber = dict["partNumber"] as! String
    let layout = dict["layout"] as! String
    let collection = dict["collection"] as! String
    let secondPart = dict["secondPart"] as! String?
    let secondLayout = dict["secondLayout"] as! String?
    let thirdPart = dict["thirdPart"] as! String?
    let thirdLayout = dict["thirdLayout"] as! String?
    
    return Polymer (workcenter: workcenter,
                    partNumber: partNumber,
                    layout: layout,
                    collection:collection,
                    secondPart:secondPart,
                    secondLayout: secondLayout,
                    thirdPart: thirdPart,
                    thirdLayout: thirdLayout
                    )
}

extension Polymer{
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










