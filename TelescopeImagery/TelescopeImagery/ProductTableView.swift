//
//  ProductTableView.swift
//  TelescopeImagery
//
//  Created by Jacob Warren on 5/21/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit

class ProductTableView: UITableViewController
{
    
    var productTableCell = ProductTableCell()
    var favoritedProduct = [String]()
    let cellIdentifier = "productCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        favoritedProduct = ["Test Label"]
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return favoritedProduct.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = favoritedProduct[indexPath.row]
        
        return cell
    }
    
}
