//
//  ToolsTableView.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/27/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit

class ToolsTableView: UITableViewController
{
    let cellIdentifier = "toolCell"
    
    var toolModel = ToolModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toolModel.loadData()
        
        self.editButtonItem.title = "Add"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        toolModel.loadData()
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toolModel.saveTool.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = "Hello"
    
        
        return cell
    }
    
}
