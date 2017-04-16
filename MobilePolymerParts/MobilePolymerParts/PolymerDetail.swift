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
    //var detail = [String]()
    let category = ["PART NUMBER", "LAYOUT"]
    var partNumberPassed:String!
    var layoutPassed:String!
    
    override func viewDidLoad() {
        
        //detail = [partNumberPassed, layoutPassed]
        
        navigationItem.title = "Part Detail"
        
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return detail.count
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = "Hello There"
        
        //cell.textLabel?.text = category[indexPath.row]
        //cell.detailTextLabel?.text = detail[indexPath.row]
        
        return cell
    }
}
