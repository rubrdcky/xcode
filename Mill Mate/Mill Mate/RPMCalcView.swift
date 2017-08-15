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
    
    var toolDiameter: Float!
    var sfm: Float!
    
    @IBOutlet weak var rpmCalculate: UIButton!
    
    @IBOutlet weak var toolDiameterField: UITextField!
    
    @IBOutlet weak var sfmField: UITextField!
    
    @IBAction func calculateButtomPressed(_ sender: Any) {
    }
    
}
