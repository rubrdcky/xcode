//
//  ToolsTableView.swift
//  Mill Mate
//
//  Created by Jacob Warren on 8/27/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit
import os.log

/*extension ToolsTableView: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailToolData = toolManufacturerGlobal[indexPath.row]
        let manufacturer = detailToolData
    }
    
}*/

class ToolsTableView: UITableViewController
{
    
    //var tool: [Tools]
    var tools = [Tools]()
    var savedToolView = ToolsSaveView()
    let detailSegueIdentifier = "detailToolSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleTools()
        
        //navigationItem.leftBarButtonItem = editButtonItem
        
       /* if let savedTools = loadTools()
        {
         tools += savedTools
        }*/
        
        self.editButtonItem.title = "Add"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.reloadData()
        
        loadTools()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return toolManufacturerGlobal.count
        return tools.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cellIdentifier = "toolCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        
        let tool = tools[indexPath.row]
        
        cell.textLabel?.text = tool.manufacturer
        cell.detailTextLabel?.text = tool.partNumber

        
        //cell.textLabel?.text  = toolManufacturerGlobal[indexPath.row]
        //cell.detailTextLabel?.text = toolPartNumberGlobal[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    private func saveTools()
    {
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(tools, toFile: Tools.ArchiveURL.path)
        
        if isSuccessfulSave
        {
            os_log("Tool successully saved.", log: OSLog.default, type: .debug)
        }else{
         
            os_log("Failed to save tool...", log: OSLog.default, type: .error)
            
        }
        
        
    }
    
    private func loadTools() -> [Tools]?
    {
      
        return NSKeyedUnarchiver.unarchiveObject(withFile: Tools.ArchiveURL.path) as? [Tools]
        
    }
    
    private func loadSampleTools()
    {
        
        guard let tool1 = Tools(manufacturer: "Maritool", partNumber: "12398743")
            else{
                 fatalError("Unable to instantiate tool1")
                }
        
        guard let tool2 = Tools(manufacturer: "Lakeshore", partNumber: "1239223")
            else{
                fatalError("Unable to instantiate tool2")
                }
                
        guard let tool3 = Tools(manufacturer: "Martitool", partNumber: "Z600rn")
            else{
                fatalError("Unable to instantiate tool3")
                }
                
            tools += [tool1, tool2, tool3]
        }
}
