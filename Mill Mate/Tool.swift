//
//  Element.swift
//  ElementList
//
//  Created by Jacob Warren on 2/18/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

//The is my MODEL

import Foundation
import CoreData



struct Tool {


    let manufacturer: String
    let partNumber: String
    let teeth: String
    let sfmRating: String
    let iptRating: String
}

//Create an element corresponding to the given dict
func from (dict: [String: AnyObject]) -> Tool {
    let manufacturer = dict["manufacturer"] as! String
    let partNumber = dict["partNumber"] as! String
    let teeth = dict["teeth"] as! String
    let sfmRating = dict["sfmRating"] as! String
    let iptRating = dict["iptRating"] as! String
    
    return Tool(manufacturer: manufacturer,
                   partNumber: partNumber,
                   teeth: teeth,
                   sfmRating: sfmRating,
                   iptRating: iptRating)
}

extension Tool {
    enum noPlistError: Error{
        case noPlistFile
        case cannotReadFile
    }
    
    //Load all the elements from the plist file
    static func loadFromPlist() throws -> [Tool] {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths.object(at: 0) as! NSString
        let path = documentsDirectory.appendingPathComponent("SavedTools.plist")
        

        //First we need to find the plist
        guard let file = Bundle.main.path(forResource: "SavedTools", ofType: "plist") else {
            throw noPlistError.noPlistFile
            
        
        //Then we read it as an array of dict
        guard let array = NSArray(contentsOfFile: file) as? [[String: AnyObject]] else {
            throw noPlistError.cannotReadFile
        }
        
        //Initialize the array
        var tools: [Tool] = []
        
        //For each dictionary
        for dict in array {
            //We implement the element
            let tool = from(dict: dict)
            //And add it to the array
            tools.append(tool)
            }
        
        //Return all tools
        return tools
    
        }
}
}

