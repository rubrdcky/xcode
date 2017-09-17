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
    
    //var toolModel = ToolModel()
    //var toolSaveModel = ToolSaveModel()
    var tools: [Tool] = []
    var savedToolView = ToolsSaveView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //toolSaveModel.loadToolData()
        
        //tools = try! Tool.loadFromPlist()
        //print(tools)
        
        self.editButtonItem.title = "Add"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //toolSaveModel.loadToolData()
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return tools.count
        return savedToolArrayGlobal.count
        
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
        
        
        //Tool Model Stuff
        //cell.textLabel?.text = tool.manufacturer
        //cell.detailTextLabel?.text = tool.partNumber
        
        //cell.textLabel?.text = toolSaveModel.manufacturerID
    
        //cell.textLabel?.text = savedToolView.toolValueArray[indexPath.row]
        
        //cell.textLabel?.text = "Still Working on it"
        
        /*if let dict = savedToolArrayGlobal[indexPath.section] as? [String:AnyObject],
        let rows = dict["rows"] as? [AnyObject],
        let result = rows[indexPath.row] as? [String:AnyObject],
        let title  = result["title"]  {
            
            cell.textLabel?.text = title as? String
            
        }*/
        
        cell.textLabel?.text = String(describing: savedToolView.toolManufacturer.value(forKey: manufacturerKey2Global))
        cell.detailTextLabel?.text = manufacturerKey2Global
        
        return cell
    }
    
}
