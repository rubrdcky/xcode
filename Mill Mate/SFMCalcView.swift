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
    var storedSFM: Float!
    var sfmResultsSegue = "sfmResultSegue"

    @IBOutlet weak var toolDiameter: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var rpm: UITextField!
    
    @IBAction func calcButtonPressed(_ sender: Any) {
        
        if (self.toolDiameter.text == "" || self.rpm.text == "")
        {
            storedSFM = 0.0
        }else{
        
        toolDiaNum = Float(toolDiameter.text!)!
        rpmNum = Float(rpm.text!)!
        storedSFM = (rpmNum * toolDiaNum * (Float.pi/12.0))
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.text = ""
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        if let ident = identifier{
            if ident == sfmResultsSegue{
                if storedSFM == 0.0{
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
        }
    }
    
    
}
