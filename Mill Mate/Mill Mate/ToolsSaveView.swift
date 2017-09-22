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
var toolManufacturerGlobal = [String]()
let manufacturerKey2Global = "Manufacturer"
var toolPartNumberGlobal = [String]()

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
    var toolManufacturer = [String]()
    //var lookForDict = savedToolArrayGlobal[1]
    
    @IBOutlet weak var materialRating: UISegmentedControl!
    
    @IBOutlet weak var addToolButton: UIBarButtonItem!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        self.gatherToolData()
        
        self.clearTextField()
    }
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
    }
    
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
        let tempTool:NSDictionary = [manufacturerKey: self.manufacturerField.text!, partNumberKey: partNumberField.text!, teethKey: teethField.text!, sfmRatingKey: sfmRatingField.text!, iptRatingKey: iptRatingField.text!] as NSDictionary
        
        savedToolArrayGlobal.append(tempTool as! [String : String])
        
        print("\(savedToolArrayGlobal)")
        
        toolManufacturerGlobal.append(String(describing: tempTool.value(forKey: manufacturerKey)!))
        
        print("\(toolManufacturerGlobal.count)")
        
        toolPartNumberGlobal.append(String(describing: tempTool.value(forKey: partNumberKey)!))
    }
    
}
