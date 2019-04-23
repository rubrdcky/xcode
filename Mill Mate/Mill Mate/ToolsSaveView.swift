//
//  ToolsTableView.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/24/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit
import os.log

var savedToolArrayGlobal: [[String:String]] = []
var toolManufacturerGlobal = [String]()
let manufacturerKey2Global = "Manufacturer"
var toolPartNumberGlobal = [String]()

class ToolsSaveView: UIViewController {
    
    //var savedTools: [Tool] = []
    var tools = [Tools]()
    var tool: Tools?
    
    
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
    
    
    @IBOutlet weak var materialRating: UISegmentedControl!
    
    @IBOutlet weak var addToolButton: UIBarButtonItem!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        
        if let savedTools = loadTools()
        {
            tools += savedTools
        }
        //self.gatherToolData()
        
        self.saveTools()
        
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
    
    private func addTool()
    {
        //add a new tool
        let newIndexPath = IndexPath(row: tools.count, section:0)
        
        let manufacturer = manufacturerField.text ?? ""
        let partNumber = partNumberField.text ?? ""
        
        tool = Tools(manufacturer: manufacturer, partNumber: partNumber)
        
        tools.append(tool!)
        
        //tableView
    }
    
    private func saveTools()
    {
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(tools, toFile: Tools.ArchiveURL.path)
        
        if isSuccessfulSave
        {
            os_log("Tool successully saved.", log: OSLog.default, type: .debug)
        }else{
            
            os_log("Failed to save tool...", log: OSLog.default, type: .error)
            
        }
        
    }
    
    private func loadTools() -> [Tools]?
    {
        
        return NSKeyedUnarchiver.unarchiveObject(withFile: Tools.ArchiveURL.path) as? [Tools]
        
    }
    
}
