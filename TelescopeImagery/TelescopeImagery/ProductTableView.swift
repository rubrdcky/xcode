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
    
    @IBOutlet weak var editBarButton: UIBarButtonItem!
    
    let cellIdentifier = "productCell"
    
    
    @IBAction func editTapped(_ sender: Any) {
    
        if (editBarButton.title == "Done" && self.tableView.isEditing)
        {
            self.tableView.setEditing(false, animated: true)
            self.editBarButton.title = "Edit"
        }else{
            
            self.tableView.setEditing(true, animated: true)
            self.editBarButton.title = "Done"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.editBarButton.title = "Edit"
        
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
    
        let myFont:UIFont = UIFont.init(name: "Arial", size: 25.0)!
        cell.textLabel?.font = myFont
        cell.textLabel?.text = favoritedProductGlobal[indexPath.row]
        
        let product:String! = cell.textLabel?.text!
        let imageName = "Configuration_"+"\(product!)"
        
        cell.imageView?.image = UIImage(named: imageName)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            favoritedProductGlobal.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
        }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let item = favoritedProductGlobal[sourceIndexPath.row]
        favoritedProductGlobal.remove(at: sourceIndexPath.row)
        favoritedProductGlobal.insert(item, at: destinationIndexPath.row)
        
    }
    
    func getCellImage(indexPath:IndexPath)
    {
        cellProductImage.image = UIImage(named: "Configuration_"+""+"\(favoritedProductGlobal[indexPath.row])"+""+".png")
    }
    
}
