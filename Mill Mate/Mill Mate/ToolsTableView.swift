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
    
    var toolModel = ToolModel()
    var toolSaveModel = ToolSaveModel()
    var tools: [ToolSaveModel] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toolSaveModel.loadToolData()
        
        //tools = try! Tool.loadFromPlist()
        //print(tools)
        
        self.editButtonItem.title = "Add"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        toolSaveModel.loadToolData()
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toolSaveModel.resultDictionary.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let tool:Tool
        
        //tool = tools[indexPath.row]
        
        //let tool:ToolSaveModel
        //tool = tools[indexPath.row]

        let cellIdentifier = "toolCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        //cell.textLabel?.text = toolSaveModel.resultDictionary.object(forKey: manufacturerKey)
        //cell.textLabel?.text = tool.manufacturerKey
        
        //cell.textLabel?.text = tool.manufacturer
        
        cell.textLabel?.text = toolSaveModel.manufacturerID
    
        
        return cell
    }
    
}
