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
    
    
    @IBOutlet weak var cellProductImage: UIImageView!
    
    
    //var productTableCell = ProductTableCell()
    //var favoritedArrayPassed = ViewController()
    //var favoritedProduct = [String]()
    let cellIdentifier = "productCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        
        tableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return favoritedProductGlobal.count
        //return favoritedArrayPassed.favoriteProducts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        //let product:String = favoritedProductGlobal[indexPath.row]
    
        let myFont:UIFont = UIFont.init(name: "Arial", size: 25.0)!
        cell.textLabel?.font = myFont
        cell.textLabel?.text = favoritedProductGlobal[indexPath.row]
        
        let product:String! = cell.textLabel?.text!
        let imageName = "Configuration_"+"\(product!)"
        
        cell.imageView?.image = UIImage(named: imageName)
        
        //cellProductImage.image = UIImage(named: imageName)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            favoritedProductGlobal.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func getCellImage(indexPath:IndexPath)
    {
        cellProductImage.image = UIImage(named: "Configuration_"+""+"\(favoritedProductGlobal[indexPath.row])"+""+".png")
    }
    
}
