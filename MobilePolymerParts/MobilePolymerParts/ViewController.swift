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
        
        if searchController.isActive &&
            searchController.searchBar.text! != ""{
            let detailPolymer = filteredPolymerParts[indexPath.row]
            
            let partNumber = detailPolymer.partNumber
            let layout = detailPolymer.layout
            let workcenter = detailPolymer.workcenter
            let collection = detailPolymer.collection
            let secondPart = detailPolymer.secondPart
            let secondLayout = detailPolymer.secondLayout
            let thirdPart = detailPolymer.thirdPart
            let thirdLayout = detailPolymer.thirdLayout
            
            print("Part number from detail polymer is \(partNumber)")
            print("Layout from detail polymer is \(layout)")
            partNumberToPass = partNumber
            layoutToPass = String(layout)
            workcenterToPass = String(workcenter)
            collectionToPass = collection
            secondPartToPass = secondPart
            secondLayoutToPass = secondLayout
            thirdPartToPass = thirdPart
            thirdLayoutToPass = thirdLayout
            
            
            performSegue(withIdentifier: detailSequeIdentifier, sender: self)
        }else{
        
            print("You selected row # \([indexPath.row])")
        
            let detailPolymer = polymerParts[indexPath.row]
        
            let partNumber = detailPolymer.partNumber
            let layout = detailPolymer.layout
            let workcenter = detailPolymer.workcenter
            let collection = detailPolymer.collection
            let secondPart = detailPolymer.secondPart
            let secondLayout = detailPolymer.secondLayout
            let thirdPart = detailPolymer.thirdPart
            let thirdLayout = detailPolymer.thirdLayout
        
            print("Part number from detail polymer is \(partNumber)")
            print("Layout from detail polymer is \(layout)")
            partNumberToPass = partNumber
            layoutToPass = String(layout)
            workcenterToPass = String(workcenter)
            collectionToPass = collection
            secondPartToPass = secondPart
            secondLayoutToPass = secondLayout
            thirdPartToPass = thirdPart
            thirdLayoutToPass = thirdLayout

            performSegue(withIdentifier: detailSequeIdentifier, sender: self)
        }
        
    }
}

extension ViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}

class ViewController: UIViewController {
    
    var currentIndexPath: NSIndexPath?
    var polymerParts: [Polymer] = []
    var filteredPolymerParts = [Polymer]()
    weak var tableView: UITableView! //make it weak for memory consideration
    var partNumberToPass:String!
    var layoutToPass:String!
    var workcenterToPass:String!
    var collectionToPass:String!
    var secondPartToPass:String!
    var secondLayoutToPass:String!
    var thirdPartToPass:String!
    var thirdLayoutToPass:String!
    let detailSequeIdentifier = "detailSegue"
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        self.tableView = tableView
        //tableView.backgroundColor = UIColor.black
        
        tableView.delegate = self
        tableView.dataSource = self
        
        polymerParts = try! Polymer.loadFromPlist()
        print(polymerParts)
        
        //Sort tablview items by partnumber
        polymerParts.sort(by: {$0.partNumber < $1.partNumber})
        
        //Nav Bar Title
        navigationItem.title = "Polymer Parts"
        
        //SearchController Stuff
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive && searchController.searchBar.text! != ""{
            return filteredPolymerParts.count
        }
        
        return polymerParts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let polymer:Polymer
        
        if searchController.isActive && searchController.searchBar.text! != ""{
            polymer = filteredPolymerParts[indexPath.row]
        }else{
        
        polymer = polymerParts[indexPath.row]
            
        }
        
        //Instantiate the Cell && reuse cells
        let cellIdentifer = "PolymerCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifer)
        
        //Adding the right information
        cell.textLabel?.text = polymer.partNumber
        cell.detailTextLabel?.text = polymer.collection
        
        //return the cell
        return cell
    }
    
    func filterContentForSearchText(searchText:String, scope:String = "All"){
        filteredPolymerParts = polymerParts.filter{polymerParts in
            return polymerParts.partNumber.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailSequeIdentifier {
            let viewController = segue.destination as! PolymerDetail
            
            viewController.partNumberPassed = partNumberToPass
            viewController.layoutPassed = layoutToPass
            viewController.workcenterPassed = workcenterToPass
            viewController.collectionPassed = collectionToPass
            viewController.secondPartPassed = secondPartToPass
            viewController.secondLayoutPassed = secondLayoutToPass
            viewController.thirdPartPassed = thirdPartToPass
            viewController.thirdLayoutPassed = thirdLayoutToPass
            
            
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
        }
    }


}

