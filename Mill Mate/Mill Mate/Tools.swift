//
//  Tools.swift
//  Mill Mate
//
//  Created by Jacob Warren on 4/6/19.
//  Copyright © 2019 Jacob Warren. All rights reserved.
//

import Foundation
import os.log

struct PropertyKey
{
    static let manufacturer = "manufacturer"
    static let partNumber = "part number"
    //static let teeth = "teeth"
    //static let sfm = "sfm"
    //static let ipt = "ipt"
    //static let coating = "coating"
}

class Tools: NSObject, NSCoding
{
    
    var manufacturer: String
    var partNumber: String
    
    //MARK: Intialization
    
    init? (manufacturer: String, partNumber: String)
    {
        //Initialization should fail if manufacturer is empty
        if manufacturer.isEmpty
        {
            return nil
        }
        //Initialize store properties
        
        self.manufacturer = manufacturer
        self.partNumber = partNumber
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(manufacturer, forKey: PropertyKey.manufacturer)
        aCoder.encode(partNumber, forKey: PropertyKey.partNumber)
        //aCoder.encode(teeth, forKey: PropertyKey.teeth)
        //aCoder.encode(sfm, forKey: PropertyKey.sfm)
        //aCoder.encode(ipt, forKey: PropertyKey.ipt)
        }
        
    required convenience init?(coder aDecoder:NSCoder)
        {
         
            // The name is reuired. if we cannot decode a name string, the initializer should fail.
            guard let manufacturer = aDecoder.decodeObject(forKey: PropertyKey.manufacturer) as? String
                else{
                    os_log("unable to decode the manufacturer for the Tools object.", log: OSLog.default, type: .debug)
                    
                    return nil
                    }
            
            let partNumber = aDecoder.decodeObject(forKey: PropertyKey.partNumber)
            
            self.init(manufacturer: manufacturer, partNumber: partNumber as! String)
            
        }
    
    //MARK: Achiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("tools")
}
