//
//  SFMResultsView.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/14/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit


class SFMResultsView: UIViewController
{
    
    @IBOutlet weak var sfmResult: UIButton!
    @IBOutlet weak var diamParamLabel: UILabel!
    @IBOutlet weak var rpmParamLabel: UILabel!
    
    
    var diamParamPassed:String!
    var rpmParamPassed:String!
    
    var sfmCalc = SFMCalcView()
    var sfmPassed:String!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.reloadLabel()
        self.loadParameters()
            
        }
    
    override func viewWillAppear(_ animated: Bool) {
        self.reloadLabel()
        self.loadParameters()
    }
    
    func reloadLabel()
    {
        if (sfmPassed == nil)
        {
            self.sfmResult.setTitle("Error", for: .normal)
            
        }else if (sfmPassed == " "){
            
            self.sfmResult.setTitle("Error", for: .normal)
            
        }else{
            
            self.sfmResult.setTitle(sfmPassed, for: .normal)
        }
    }
    
    func loadParameters()
    {
        self.diamParamLabel.text = self.diamParamPassed
        self.rpmParamLabel.text = self.rpmParamPassed
    }
    
    }
