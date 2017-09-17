//
//  ToolsTableView.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/24/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit

var savedToolArrayGlobal: [[String:String]] = []
var toolManufacturerGlobal:NSDictionary = [:]
let manufacturerKey2Global = "Manufacturer"

class ToolsSaveView: UIViewController {
    
   // var toolModel = ToolModel()
   // var toolSaveModel = ToolSaveModel()
    var savedTools: [Tool] = []
    
    
    
    @IBOutlet weak var manufacturerField: UITextField!
    @IBOutlet weak var partNumberField: UITextField!
    @IBOutlet weak var teethField: UITextField!
    @IBOutlet weak var sfmRatingField: UITextField!
    @IBOutlet weak var iptRatingField: UITextField!
    
    let manufacturerKey = "Manufacturer"
    let partNumberKey = "Part Number"
    let teethKey = "No Teeth"
    let sfmRatingKey = "SFM Rating"
    let iptRatingKey = "IPT Rating"
    
    var manufacturerTableLabel:String = ""
    var partNumberTableLabel:String = ""
    var toolValueArray = [String]()
    var toolManufacturer:NSDictionary = [:]
    //var lookForDict = savedToolArrayGlobal[1]
    
    @IBOutlet weak var materialRating: UISegmentedControl!
    
    @IBOutlet weak var addToolButton: UIBarButtonItem!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        //toolModel.saveData()
        //onCreateData()
        //saveItem()
        //toolSaveModel.saveToolData()
        
        //self.gatherToolData()
        
        self.saveTool()
        
       //print("succeed", toolModel.dataFilePath())
        self.clearTextField()
    }
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
       // onCreateData()
        
        
    }
    
    
    //func onCreateData() {
        
    //}
    
   /* func saveItem()
    {
        //toolModel.saveTool.append(.init(manufacturer: manufacturerField.text!, partNumber: partNumberField.text!, teeth: teethField.text!, sfmRating: sfmRatingField.text!, iptRating: iptRatingField.text!))
        
        //toolModel.saveTool.append(.init(coder: manufacturerField.text)
        
        //toolModel.saveData()
        
        toolSaveModel.manufacturerID = self.manufacturerField.text!
        toolSaveModel.partNumberID = self.partNumberField.text!
        toolSaveModel.teethID = self.teethField.text!
        toolSaveModel.sfmRatingID = self.sfmRatingField.text!
        toolSaveModel.iptRatingID = self.iptRatingField.text!
    }*/
    
    func clearTextField()
    {
        
        manufacturerField.text = ""
        partNumberField.text = ""
        teethField.text = ""
        sfmRatingField.text = ""
        iptRatingField.text = ""
        
    }
    
    func gatherToolData()
    {
        let tools = Tool(manufacturer: self.manufacturerField.text!, partNumber: partNumberField.text!, teeth: teethField.text!, sfmRating: sfmRatingField.text!, iptRating: iptRatingField.text!)
        
        savedTools.append(tools)
        
        print("\(tools)")
    }
    
    func saveTool()
    {
        let tempToolDic = [manufacturerKey2Global:manufacturerField.text!, partNumberKey:partNumberField.text!]
        
        manufacturerTableLabel = self.manufacturerField.text!
        partNumberTableLabel = self.manufacturerField.text!
        
        savedToolArrayGlobal.append(tempToolDic)
        
        print("Added \(tempToolDic)")
        
        print ("Current contents of ToolDict: \(savedToolArrayGlobal)")
        
        for i in 0 ..< savedToolArrayGlobal.count
        {
            toolManufacturerGlobal = savedToolArrayGlobal[i] as NSDictionary!
            
            print("\(String(describing: toolManufacturerGlobal .value(forKey: manufacturerKey2Global)!))")
        }
        
        //lookForDict[manufacturerKey2Global]
        //print("\(lookForDict[manufacturerKey2Global]!)")
        
    }
    
}
