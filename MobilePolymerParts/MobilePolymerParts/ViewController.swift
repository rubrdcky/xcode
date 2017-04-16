//
//  ViewController.swift
//  MobilePolymerParts
//
//  Created by Jacob Warren on 3/29/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: detailSequeIdentifier, sender: self)
        
        print("You selected row # \([indexPath.row])")
        
        let detailPolymer = polymerParts[indexPath.row]
        partNumberToPass = detailPolymer.partNumber
        layoutToPass = detailPolymer.layout

        
        
    }
}

class ViewController: UIViewController {
    
    var currentIndexPath: NSIndexPath?
    var polymerParts: [Polymer] = []
    weak var tableView: UITableView! //make it weak for memory consideration
    var partNumberToPass:String!
    var layoutToPass:String!
    let detailSequeIdentifier = "detailSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        self.tableView = tableView
        
        tableView.delegate = self
        tableView.dataSource = self
        
        polymerParts = try! Polymer.loadFromPlist()
        print(polymerParts)
        
        //Sort tablview items by partnumber
        polymerParts.sort(by: {$0.partNumber < $1.partNumber})
        
        //Nav Bar Title
        navigationItem.title = "Polymer Parts"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return polymerParts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let polymer:Polymer
        
        polymer = polymerParts[indexPath.row]
        
        //Instantiate the Cell && reuse cells
        let cellIdentifer = "PolymerCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifer)
        
        //Adding the right information
        cell.textLabel?.text = polymer.partNumber
        cell.detailTextLabel?.text = polymer.collection
        
        //return the cell
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailSequeIdentifier {
            let viewController = segue.destination as! PolymerDetail
            
            viewController.partNumberPassed = partNumberToPass
            viewController.layoutPassed = layoutToPass
            
            
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
        }
    }


}

