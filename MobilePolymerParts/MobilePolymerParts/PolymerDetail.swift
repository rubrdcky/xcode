//
//  PolymerDetail.swift
//  MobilePolymerParts
//
//  Created by Jacob Warren on 4/1/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit

class PolymerDetail: UIViewController, UITableViewDelegate, UITableViewDataSource

{
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "Polymer Cell"
    var detail = [String]()
    var detailSecond = [String]()
    let category = ["WORKCENTER", "COLLECTION","PART NUMBER", "LAYOUT", "SECOND PART", "SECOND LAYOUT", "THIRD PART", "THIRD LAYOUT", "FOURTH PART", "FOURTH LAYOUT"]
    var partNumberPassed:String!
    var layoutPassed:String!
    var workcenterPassed:String!
    var collectionPassed:String!
    var secondPartPassed:String!
    var secondLayoutPassed:String!
    var thirdPartPassed:String!
    var thirdLayoutPassed:String!
    var fourthPartPassed:String!
    var fourthLayoutPassed:String!
    var fifthPartPassed:String!
    var fifthLayoutPassed:String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (secondPartPassed == nil)
        {
            detail = [workcenterPassed, collectionPassed,partNumberPassed, layoutPassed]
            
        }else if (thirdPartPassed == nil) {
            
            detailSecond = [workcenterPassed, collectionPassed,partNumberPassed, layoutPassed, secondPartPassed, secondLayoutPassed]
        }else if (fourthPartPassed == nil) {
            
            detailSecond = [workcenterPassed, collectionPassed,partNumberPassed, layoutPassed, secondPartPassed, secondLayoutPassed, thirdPartPassed, thirdLayoutPassed]
        }else{
            
            detailSecond = [workcenterPassed, collectionPassed,partNumberPassed, layoutPassed, secondPartPassed, secondLayoutPassed, thirdPartPassed, thirdLayoutPassed, fourthPartPassed, fourthLayoutPassed]
            
        }
        
        navigationItem.title = partNumberPassed + " " + "Detail"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //self.findCollection()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if (secondPartPassed == nil)
        {
            return detail.count
        }else{
            return detailSecond.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

            cell.textLabel?.text = category[indexPath.row]
        
        if (secondPartPassed == nil){
            cell.detailTextLabel?.text = detail[indexPath.row]
        }else{
            cell.detailTextLabel?.text = detailSecond[indexPath.row]
        }
        
        return cell
    }
    
   /* func findCollection()
    {
        let collection:String = collectionPassed
        let URL:String
        
        switch collection {
            
            case "Leeward":
                
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/466_1-580x391.jpg"
            
            case "Adirondack":
            
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1116_1-580x391.jpg"
            
            case "Plymouth Bay":
            
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1709_1-580x391.jpg"
            
            case "St Catherine":
            
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1059_1-580x391.jpg"
            
            case "Bazza":
            
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1716_1-580x391.jpg"
            
            case "Fire Tables":
            
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1594_1-580x391.jpg"
            
            case "Extension Table":
            
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1234_1-580x391.jpg"
            
            case "Acrylic Tables":
            
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/22_1-580x391.jpg"
            
            case "Tables":
            
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1754_1-580x391.jpg"
            
            case "Beach":
            
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1647_1-580x391.jpg"
            
            case "Dune":
            
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1004_1-580x391.jpg"
            
            case "Ashbee":
            
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1339_1-580x391.jpg"
            
            case "Storage Box":
            
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1592_1-580x391.jpg"
            
            case "Belle Isle":
            
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1372_1-580x391.jpg"
            
            case "Trash Receptacle":
            
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1723_1-580x391.jpg"
            
            case "Avant":
            
                URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1010_1-580x391.jpg"
            
            default:
                
                URL = "https://www.telescopecasual.com/wp-content/uploads/2012/11/plant.jpg"
                
            
            print ("Collection Selected was \(collection)")
            
        }
            if let url = NSURL(string:URL){
            if let data = NSData(contentsOf: url as URL){
            collectionImage.image = UIImage(data:data as Data)
            collectionImage.contentMode = UIViewContentMode(rawValue: 2)!
            }}
    }*/
}
