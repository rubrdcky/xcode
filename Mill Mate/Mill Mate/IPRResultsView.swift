//
//  IPRResultsView.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/17/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit

class IPRResultsView: UIViewController {
    
    var iprResultPassed: String!
    
    @IBOutlet weak var iprResultButton: UIButton!
    
    @IBOutlet weak var rpmParamLabel: UILabel!
    @IBOutlet weak var ipmParamLabel: UILabel!
    
    var rpmPassed: String!
    var ipmPassed: String!
    
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
        self.iprResultButton.setTitle(iprResultPassed, for: .normal)
    }
    
    func loadParameters()
    {
        self.rpmParamLabel.text = self.rpmPassed
        self.ipmParamLabel.text = self.ipmPassed
    }
    
}
