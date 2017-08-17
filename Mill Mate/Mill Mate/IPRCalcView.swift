//
//  IPRCalcView.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/17/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import  UIKit

class IPRCalcView: UIViewController {
    
    @IBOutlet weak var rpmField: UITextField!
    @IBOutlet weak var ipmField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var iprResultsSegue = "iprResultsSegue"
    
    var rpmNum: Float!
    var ipmNum: Float!
    var iprResult: Float!
    
    var rpmToPass: String!
    var ipmToPass: String!
    
    @IBAction func calcButtonPressed(_ sender: Any) {
        
        if (rpmField.text != "" && ipmField.text != "")
        {
            self.rpmNum = Float(rpmField.text!)!
            self.ipmNum = Float(ipmField.text!)!
        
            self.iprResult = ipmNum / rpmNum
            
            rpmToPass = self.rpmField.text
            ipmToPass = self.ipmField.text
            
        }else
        {
            self.errorLabel.text = "You seem to be missing something"
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.errorLabel.text = ""
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.errorLabel.text = ""
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        if let ident = identifier{
            if ident == iprResultsSegue{
                if iprResult == 0.0 || iprResult == nil{
                    
                    self.errorLabel.text = "You seem to be missing something"
                    return false
                }
            }
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == iprResultsSegue{
            let viewController = segue.destination as! IPRResultsView
            viewController.iprResultPassed = String(iprResult)
            
            viewController.rpmPassed = rpmToPass
            viewController.ipmPassed = ipmToPass
        }
    }
    
    
}
