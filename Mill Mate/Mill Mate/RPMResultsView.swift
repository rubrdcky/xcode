//
//  RPMResultsView.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/15/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit

class RPMResultsView: UIViewController
{
    var rpmCalc = RPMCalcView()
    var rpmPassed:String!
    @IBOutlet weak var rpmResultButton: UIButton!
    
    @IBOutlet weak var diamParamLabel: UILabel!
    @IBOutlet weak var sfmParamLabel: UILabel!
    
    var diamParamPassed: String!
    var sfmParamPassed: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadLabel()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.reloadLabel()
    }
    
    func reloadLabel()
    {
        if (rpmPassed == nil)
        {
            self.rpmResultButton.setTitle("Error", for: .normal)
            
        }else if (rpmPassed == ""){
            
            self.rpmResultButton.setTitle("Error", for: .normal)
            
        }else{
            
            self.rpmResultButton.setTitle(rpmPassed, for: .normal)
            
            self.diamParamLabel.text = diamParamPassed
            self.sfmParamLabel.text = sfmParamPassed
        }
    }
    
}
