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
    
    @IBOutlet weak var ipmResultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.reloadLabel()
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
}
