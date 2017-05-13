//
//  CollectionModel.swift
//  TelescopeImagery
//
//  Created by Jacob Warren on 5/12/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import CoreData

struct Collection {
 
    let collection:String

}

//var polymerStruct = Polymer()

//Create Polymer Parts corresponding to the given dict

func from (dict: [String: AnyObject]) -> Collection{
    let collection = dict["collection"] as! String
    
    return Collection (collection:collection)
}

extension Collection{
    enum noPlistError: Error{
        case noPlistFile
        case cannotReadFile
    }
    //Load all of the parts from the plist file
    static func loadFromPlist() throws -> [Collection] {
        //First we need to find the plist
        guard let file = Bundle.main.path(forResource: "Collections", ofType: "plist") else {
            throw noPlistError.noPlistFile
        }
        //Then we read it as an array of dict
        guard let array = NSArray(contentsOfFile: file) as? [[String:AnyObject]] else {
            throw noPlistError.cannotReadFile
        }
        //Initialize the array
        var collectionList: [Collection] = []
        
        //for each dictionary
        for dict in array {
            //we implement the part
            let collections = from(dict: dict)
            //and add it to the array
            collectionList.append(collections)
        }
        
        //Return all Collections
        return collectionList
    }
    
    
}










