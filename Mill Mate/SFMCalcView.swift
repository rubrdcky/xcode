//
//  SFMCalcView.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/8/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit

class SFMCalcView: UIViewController
{
    
    var toolDiaNum: Float!
    var rpmNum: Float!
    var storedSFM: Int!
    var tempSFM:Float!
    var sfmResultsSegue = "sfmResultSegue"
    
    var diamaParamToPass: String!
    var rpmParamToPass: String!

    @IBOutlet weak var toolDiameter: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var rpm: UITextField!
    @IBAction func calcButtonPressed(_ sender: Any) {
        
        if (self.toolDiameter.text == "" ||
            self.rpm.text == "")
        {
            storedSFM = 0
        }else{
        
        toolDiaNum = Float(toolDiameter.text!)!
        rpmNum = Float(rpm.text!)!
        tempSFM = (rpmNum * toolDiaNum * (Float.pi/12.0))
            
        storedSFM = Int(tempSFM)
            
        self.diamaParamToPass = toolDiameter.text
        self.rpmParamToPass = rpm.text
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.text = ""
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        if let ident = identifier{
            if ident == sfmResultsSegue{
                if storedSFM == 0{
                    self.errorLabel.text = "You seem to be missing something"
                return false
            }
        }
    }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == sfmResultsSegue {
            let viewController = segue.destination as! SFMResultsView
            viewController.sfmPassed = String(storedSFM)
            viewController.diamParamPassed = diamaParamToPass
            viewController.rpmParamPassed = rpmParamToPass
        }
    }
    
    
}
