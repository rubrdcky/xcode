//
//  IPMCalcView.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/14/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit

class IPMCalcView: UIViewController

{
    var rpmNum: Float!
    var iptNum: Float!
    var teethNum: Float!
    var storedIPM: Float!
    var ipmResultsSegue = "ipmResultsSegue"
    
    var rpmParamToPass:String!
    var iptParamToPass:String!
    var teethParamToPass:String!
    var rpmButtonTitlePassed:String!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var rpmField: UITextField!
    
    @IBOutlet weak var iptField: UITextField!
    
    @IBOutlet weak var teethField: UITextField!

    @IBAction func calcButtonPressed(_ sender: Any) {
        
        if (self.rpmField.text == "" || self.iptField.text == "" || self.teethField.text == "")
        {
            storedIPM = 0.0
        }else{
            
            rpmNum = Float(rpmField.text!)!
            iptNum = Float(iptField.text!)!
            teethNum = Float(teethField.text!)!
            
            let tempStore = teethNum * iptNum
            
            storedIPM = tempStore * rpmNum
            
            rpmParamToPass = self.rpmField.text
            iptParamToPass = self.iptField.text
            teethParamToPass = self.teethField.text
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.errorLabel.text = ""
        
        if (rpmButtonTitlePassed == nil){
            self.rpmField.text = ""
        }else {
            self.rpmField.text = rpmButtonTitlePassed
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.errorLabel.text = ""
        
        if (rpmButtonTitlePassed == nil){
            self.rpmField.text = ""
            self.iptField.text = ""
            self.teethField.text = ""
        }else {
            self.rpmField.text = rpmButtonTitlePassed
            self.iptField.text = ""
            self.teethField.text = ""
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        if let ident = identifier{
            if ident == ipmResultsSegue{
                if storedIPM == 0.0{
                    self.errorLabel.text = "You seem to be missing something"
                    return false
                }
            }
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ipmResultsSegue{
            let viewController = segue.destination as! IPMResultsView
            viewController.ipmPassed = String(storedIPM)
            
            viewController.rpmParamPassed = rpmParamToPass
            viewController.iptParamPassed = iptParamToPass
            viewController.teethParamPassed = teethParamToPass
        }
    }
    
    
}
