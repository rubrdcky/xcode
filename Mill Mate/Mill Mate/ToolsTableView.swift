//
//  ToolsTableView.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/27/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit

/*extension ToolsTableView: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailToolData = toolManufacturerGlobal[indexPath.row]
        let manufacturer = detailToolData
    }
    
}*/

class ToolsTableView: UITableViewController
{
    
    //var tools: [Tool] = []
    var savedToolView = ToolsSaveView()
    let detailSegueIdentifier = "detailToolSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.editButtonItem.title = "Add"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toolManufacturerGlobal.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cellIdentifier = "toolCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)

        
        cell.textLabel?.text  = toolManufacturerGlobal[indexPath.row]
        cell.detailTextLabel?.text = toolPartNumberGlobal[indexPath.row]
        
        return cell
    }
    
}
