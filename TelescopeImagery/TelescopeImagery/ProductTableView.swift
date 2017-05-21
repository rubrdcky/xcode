//
//  ProductTableView.swift
//  TelescopeImagery
//
//  Created by Jacob Warren on 5/21/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit

var favoritedProductGlobal = [String]()

class ProductTableView: UITableViewController
{
    
    var productTableCell = ProductTableCell()
    //var favoritedArrayPassed = ViewController()
    var favoritedProduct = [String]()
    let cellIdentifier = "productCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //updateTableVIew()
        //favoritedProduct = ["Nothing to see here"]
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return favoritedProductGlobal.count
        //return favoritedArrayPassed.favoriteProducts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //updateTableVIew()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        //cell.textLabel?.text = favoritedArrayPassed.favoriteProducts[indexPath.row]
        cell.textLabel?.text = favoritedProductGlobal[indexPath.row]
        
        return cell
    }
    
    /*func updateTableVIew()
    {
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: favoritedProductGlobal.count-1, section:0)], with: .automatic)
        tableView.endUpdates()
        
        tableView.reloadData()
        
    }*/
    
}
