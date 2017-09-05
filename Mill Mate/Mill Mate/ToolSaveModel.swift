//
//  ToolSaveModel.swift
//  Mill Mate
//
//  Created by Jacob Warren on 9/2/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation

class ToolSaveModel: NSObject
{
    let manufacturerKey = "manufacturer"
    let partNumberKey = "partNumber"
    let teethKey = "teeth"
    let sfmRatingKey = "sfmRating"
    let iptRatingKey = "iptRating"
    
    var manufacturerID: String = "Maritool"
    var partNumberID: String = "600"
    var teethID: String = "3"
    var sfmRatingID: String = "650"
    var iptRatingID: String = "0.005"
    
    var resultDictionary: NSMutableDictionary = [:]
    
    func loadToolData()
    {
        
        //Getting path to SavedTools.plist
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths.object(at: 0) as! NSString
        let path = documentsDirectory.appendingPathComponent("SavedTools.plist")
        
        let filemanager = FileManager.default
        
        //Checking if file exists
        
        if !filemanager.fileExists(atPath: path){
            
            guard let bundlePath = Bundle.main.path(forResource: "SavedTools", ofType: "plist") else {return}
            
            do{
                try filemanager.copyItem(atPath: bundlePath, toPath: path)
            }catch let error as NSError{
                print("Unable to copy file. ERROR \(error.localizedDescription)")
            }
        }
        
        resultDictionary = NSMutableDictionary(contentsOfFile: path)!
        print("Loaded SavedTools.plist file is --> \(resultDictionary.description )")
        
        let myDict = NSDictionary(contentsOfFile: path)
        
        if let dict = myDict{
            //loading Values
            manufacturerID = dict.object(forKey: manufacturerKey) as! String
            partNumberID = dict.object(forKey: partNumberKey) as! String
            teethID = dict.object(forKey: teethKey) as! String
            sfmRatingID = dict.object(forKey: sfmRatingKey) as! String
            //iptRatingID = dict.object(forKey: iptRatingID) as! String
            
        } else{
            print ("WARNING: Couldn't crete dictionary from SavedTools.plist! Default values were used!")
        }
        
    }
    
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
    
    func saveToolData()
    {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths.object(at: 0) as! NSString
        let path = documentsDirectory.appendingPathComponent("SavedTools.plist")

        
        let dict: NSMutableDictionary = ["XInitializerItem": "DoNotEverChange"]
        
        //saving values
        
        dict.setObject(manufacturerID, forKey: manufacturerKey as NSCopying)
        dict.setObject(partNumberID, forKey: partNumberKey as NSCopying)
        dict.setObject(teethID, forKey: teethKey as NSCopying)
        dict.setObject(sfmRatingID, forKey: sfmRatingKey as NSCopying)
        dict.setObject(iptRatingID, forKey: iptRatingKey as NSCopying)
        
        //writing to SavedTools.plist
        
        dict.write(toFile: path, atomically: false)
        
        
        resultDictionary = NSMutableDictionary(contentsOfFile: path)!
        print("Saved SavedTools.plist file is --> \(resultDictionary.description )")
        
        
    }
    
    
}
