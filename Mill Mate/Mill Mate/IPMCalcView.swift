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
    var teethNum: Int!
    var storedIPM: String!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var rpmField: UITextField!
    
    @IBOutlet weak var iptField: UITextField!
    
    @IBOutlet weak var teethField: UITextField!

    @IBAction func calcButtonPressed(_ sender: Any) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.errorLabel.text = ""
        
    }
}
