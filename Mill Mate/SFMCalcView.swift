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
    
    @IBOutlet weak var rpm: UITextField!
    
    @IBAction func calcButtonPressed(_ sender: Any) {
        toolDiaNum = Float(toolDiameter.text!)!
        rpmNum = Float(rpm.text!)!
        storedSFM = (rpmNum * toolDiaNum * (Float.pi/12.0))
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == sfmResultsSegue {
            let viewController = segue.destination as! SFMResultsView
            viewController.sfmPassed = String(storedSFM)
        }
    }
    
    
}
