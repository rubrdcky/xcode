//
//  IPMResultsView.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/15/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit

class IPMResultsView: UIViewController
{

    var ipmPassed: String!
    //var ipmCalc = IPMCalcView()
    
    @IBOutlet weak var ipmResultButton: UIButton!
    
    @IBOutlet weak var teethParamLabel: UILabel!
    @IBOutlet weak var iptParamLabel: UILabel!
    @IBOutlet weak var rpmParamLabel: UILabel!
    
    var rpmParamPassed:String!
    var iptParamPassed:String!
    var teethParamPassed:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadLabel()
        self.loadParameters()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.reloadLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.reloadLabel()
        self.loadParameters()
    }
    
    func reloadLabel()
    {
        if (ipmPassed == nil)
        {
            self.ipmResultButton.setTitle("ErrorNil", for: .normal)
            
        }else if(ipmPassed == ""){
            
            self.ipmResultButton.setTitle("Error", for: .normal)
            
        }else{
            
            self.ipmResultButton.setTitle(ipmPassed, for: .normal)
            
        }
        
            }
    
    func loadParameters()
        {
            self.rpmParamLabel.text = self.rpmParamPassed
            self.iptParamLabel.text = self.iptParamPassed
            self.teethParamLabel.text = self.teethParamPassed
                
        }

}
