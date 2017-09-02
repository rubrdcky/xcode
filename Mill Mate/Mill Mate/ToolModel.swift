//
//  ToolModel.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/8/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import CoreData

class SavedTools: NSObject,NSCoding {
    
    var manufacturer: String
    var partNumber: String
    var teeth: String
    var sfmRating: String
    var iptRating: String
    //var materialRating: String
    
    /*required init(manufacturer:String="", partNumber:String="", teeth:String="", sfmRating:String="", iptRating:String=""/*, materialRating:String=""*/) {
        
        self.manufacturer = manufacturer
        self.partNumber = partNumber
        self.teeth = teeth
        self.sfmRating = sfmRating
        self.iptRating = iptRating
        //self.materialRating = materialRating
    }*/
    
    required init(coder aDecoder: NSCoder) {
        self.manufacturer = aDecoder.decodeObject(forKey: "manufacturer") as? String ?? ""
        self.partNumber = aDecoder.decodeObject(forKey: "partNumber") as? String ?? ""
        self.teeth = aDecoder.decodeObject(forKey: "teeth") as? String ?? ""
        self.sfmRating = aDecoder.decodeObject(forKey:"sfmRating") as? String ?? ""
        self.iptRating = aDecoder.decodeObject(forKey:"iptRating") as? String ?? ""
        //self.materialRating = aDecoder.decodeObject(forKey:"materialRating") as? String ?? ""
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(manufacturer, forKey:"manufacturer")
        aCoder.encode(partNumber, forKey:"partNumber")
        aCoder.encode(teeth, forKey:"teeth")
        aCoder.encode(sfmRating, forKey:"sfmRating")
        aCoder.encode(iptRating, forKey:"iptRating")
        //aCoder.encode(materialRating, forKey:"materialRating")
    }
}

class ToolModel:NSObject{
    
    var saveTool = [SavedTools]()
    
    override init(){
        super.init()
        print("Document file path: \(documentsDirectory())")
        print("Data file path: \(dataFilePath())")
    }
    
    func saveData() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(saveTool, forKey: "SavedTools")
        archiver.finishEncoding()
            data.write(toFile: dataFilePath(), atomically: true)
    }
    
    func loadData() {
        
        let path = self.dataFilePath()
        let defaultManager = FileManager()
        if defaultManager.fileExists(atPath: path) {
            let url = URL(fileURLWithPath: path)
            let data = try! Data(contentsOf: url)
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            saveTool = unarchiver.decodeObject(forKey: "SavedTools") as! Array
            unarchiver.finishDecoding()
        }
    }
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                    .userDomainMask, true)
        let documentsDirectory = paths.first!
        return documentsDirectory
    }
    
    func dataFilePath() -> String {
        return self.documentsDirectory().appendingFormat("/SavedTools.plist")
    }
}
