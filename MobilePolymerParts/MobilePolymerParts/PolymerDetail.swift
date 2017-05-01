//
//  PolymerDetail.swift
//  MobilePolymerParts
//
//  Created by Jacob Warren on 4/1/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit

class PolymerDetail: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "Polymer Cell"
    var detail = [String]()
    var detailSecond = [String]()
    let category = ["WORKCENTER", "COLLECTION","PART NUMBER", "LAYOUT", "SECOND PART", "SECOND LAYOUT"]
    var partNumberPassed:String!
    var layoutPassed:String!
    var workcenterPassed:String!
    var collectionPassed:String!
    var secondPartPassed:String!
    var secondLayoutPassed:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (secondPartPassed == nil)
        {
            detail = [workcenterPassed, collectionPassed,partNumberPassed, layoutPassed]
        }else{
            detailSecond = [workcenterPassed, collectionPassed,partNumberPassed, layoutPassed, secondPartPassed, secondLayoutPassed]
        }
        
        navigationItem.title = partNumberPassed + " " + "Detail"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if (secondPartPassed == nil)
        {
            return detail.count
        }else{
            return detailSecond.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

            cell.textLabel?.text = category[indexPath.row]
        
        if (secondPartPassed == nil){
            cell.detailTextLabel?.text = detail[indexPath.row]
        }else{
            cell.detailTextLabel?.text = detailSecond[indexPath.row]
        }
        
        return cell
    }
}
