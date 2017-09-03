//
//  ToolsTableView.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/24/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit

class ToolsSaveView: UIViewController {
    
    var toolModel = ToolModel()
    var toolSaveModel = ToolSaveModel()
    
    @IBOutlet weak var manufacturerField: UITextField!
    @IBOutlet weak var partNumberField: UITextField!
    @IBOutlet weak var teethField: UITextField!
    @IBOutlet weak var sfmRatingField: UITextField!
    @IBOutlet weak var iptRatingField: UITextField!
    
    @IBOutlet weak var materialRating: UISegmentedControl!
    
    @IBOutlet weak var addToolButton: UIBarButtonItem!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        //toolModel.saveData()
        //onCreateData()
        saveItem()
        toolSaveModel.saveToolData()
        
       // print("succeed", toolModel.dataFilePath())
        
        //manufacturerField.text = ""
        //partNumberField.text = ""
        //teethField.text = ""
        //sfmRatingField.text = ""
        //iptRatingField.text = ""
        

    }
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
       // onCreateData()
        
        
    }
    
    
    //func onCreateData() {
        
    //}
    
    func saveItem()
    {
        //toolModel.saveTool.append(.init(manufacturer: manufacturerField.text!, partNumber: partNumberField.text!, teeth: teethField.text!, sfmRating: sfmRatingField.text!, iptRating: iptRatingField.text!))
        
        //toolModel.saveTool.append(.init(coder: manufacturerField.text)
        
        //toolModel.saveData()
        
        toolSaveModel.manufacturerID = self.manufacturerField.text!
        toolSaveModel.partNumberID = self.partNumberField.text!
        toolSaveModel.teethID = self.teethField.text!
        toolSaveModel.sfmRatingID = self.sfmRatingField.text!
        toolSaveModel.iptRatingID = self.iptRatingField.text!
    }
    
}
