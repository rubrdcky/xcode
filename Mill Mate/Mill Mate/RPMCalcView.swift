//
//  RPMCalcView.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/14/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit

class RPMCalcView: UIViewController
{
    
    var toolDiaNum: Float!
    var sfmNum: Float!
    var storedRPM: Float!
    var rpmResultsSegue = "rpmResultSegue"
    
    @IBOutlet weak var rpmCalculate: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var toolDiameterField: UITextField!
    
    @IBOutlet weak var sfmField: UITextField!
    
    @IBAction func calculateButtomPressed(_ sender: Any) {
        
        if (self.toolDiameterField.text == "" || self.sfmField.text == "")
        {
            storedRPM = 0.0
        }else{
            
            toolDiaNum = Float(toolDiameterField.text!)!
            sfmNum = Float(sfmField.text!)!
            storedRPM = (sfmNum * (12/Float.pi))/toolDiaNum
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        if let ident = identifier{
            if ident == rpmResultsSegue{
                if storedRPM == 0.0{
                    self.errorLabel.text = "You seem to be missing something"
                return false
                }
            }
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == rpmResultsSegue{
            let viewController = segue.destination as! RPMResultsView
            viewController.rpmPassed = String(storedRPM)
        }
    }
    
    
    
}
