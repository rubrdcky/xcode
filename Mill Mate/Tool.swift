//
//  Tool.swift
//  Mill Mate
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
func saveTool (dict: [String: AnyObject]) -> Tool {
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

/*func gatherToolData()
{
    /*enum noPlist: Error
    {
        case noPlistFile
        case cannotReadFile
    }*/
    
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
    let documentsDirectory = paths.object(at: 0) as! NSString
    let path = documentsDirectory.appendingPathComponent("Tool.plist")
    
    let fileManager = FileManager.default
    
    //Check is file exits
    if(!fileManager.fileExists(atPath: path))
    {
        //If it doesnt, copy it from the default file in the Resources folder
        let bundle  = Bundle.main.path(forResource: "Tool", ofType: "plist")
        //fileManager.copyItemAtPath(bundle!, toPath: path)
        do{
            try fileManager.copyItem(atPath: bundle!, toPath: path)
        } catch let error as NSError {
            print("Couldn't copy file to final location! Error:\(error.description)")
        }
    }else {
        
        print("File did not exist! Default copied...")
    }

    let dict = NSMutableDictionary(contentsOfFile: path)!
    
    let mySavedTools: AnyObject = dict.object(forKey: "Tools")! as AnyObject
    
    print("plist all: \(mySavedTools)")
    
    if let nsArray:NSArray = mySavedTools as? NSArray
    {
        for loadCount in 0 ..< mySavedTools.count
        {
            var toolDict: AnyObject = nsArray[loadCount] as AnyObject // loading data array at index
            let arrayManufacturer = toolDict["Manufacturer"] as AnyObject? as! String
            let arrayPartNumber = toolDict["partNumber"] as AnyObject? as! String
            let teeth = toolDict["teeth"] as AnyObject as! String
            let sfmRating = toolDict["sfmRating"] as AnyObject? as! String
            let iptRating = toolDict["iptRating"] as AnyObject as! String
        }
    }
    
    //convert AnyObject to NSMutableArray
    var toolDataArray = (mySavedTools as! NSMutableArray) as NSMutableArray
    
    //Creat a new dictionary
    let tool: [String:String] = ["Manufacturer" : ]
}

extension Tool {
    enum noPlistError: Error{
        case noPlistFile
        case cannotReadFile
    }
    
    /*//Load all the elements from the plist file
    static func loadFromPlist() throws -> [Tool] {
        
        //First we need to find the plist
        guard let file = Bundle.main.path(forResource: "SavedTools", ofType: "plist") else {
            throw noPlistError.noPlistFile
        }
        
        //Then we read it as an array of dict
        guard let array = NSArray(contentsOfFile: file) as? [[String: AnyObject]] else {
            throw noPlistError.cannotReadFile
        }
        
        //Initialize the array
        var tools: [Tool] = []
        
        //For each dictionary
        for dict in array {
            //We implement the element
            let tool = saveTool(dict: dict)
            //And add it to the array
            tools.append(tool)
            }
        
        //Return all tools
        return tools
    
        }*/
    
    static func createToolData() -> [Tool] {
        
        
}
*/
