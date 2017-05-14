//
//  ViewController.swift
//  TelescopeImagery
//
//  Created by Jacob Warren on 5/13/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == mgpCollectionView){
            return mgpAccents.count
        }else{
            return pcAccents.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == mgpCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mgpCell", for: indexPath) as! mgpCell
            let cellColor = colorForIndexPath(indexPath: indexPath as NSIndexPath)
            cell.backgroundColor = cellColor
            cell.mgpColorLabel.text = mgpAccents[indexPath.row]
            cell.mgpColorLabel.textColor = UIColor.black
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pcCell", for: indexPath) as! pcCell
            let cellColor = colorForIndexPath(indexPath: indexPath as NSIndexPath)
            cell.backgroundColor = cellColor
            cell.pcColorLabel.text = pcAccents[indexPath.row]
            cell.pcColorLabel.textColor = UIColor.black
            
            return cell
        }
        
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //let cell  = collectionView.cellForItem(at: indexPath)
        //cell?.layer.borderWidth = 4.0
        //cell?.layer.borderColor = UIColor.black.cgColor
        
        //print("Selected cell number \(mgpAccents[indexPath.row])")
        if (collectionView == mgpCollectionView){
            productAccent = String(mgpAccents[indexPath.row])
            reloadProductLabel()
        }else{
            
            productColor = String(pcAccents[indexPath.row])
            reloadProductLabel()
        }
    }
}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var chairImage: UIImageView!
    @IBOutlet weak var collectionPicker: UIPickerView!
    @IBOutlet weak var mgpCollectionView: UICollectionView!
    @IBOutlet weak var powdercoatCollectionView: UICollectionView!
    @IBOutlet weak var productCodeLabel: UILabel!
    
    var pickerData = ["Collection:","Avant", "Bazza MGP Chair", "Plymouth Bay"]
    let mgpAccents = ["P10", "P30", "P40", "P50", "P60", "P70", "PR0", "PA0", "PQ0", "PM0", "PN0"]
    var pcAccents = ["K", "J", "T", "5", "6", "D", "8", "A", "L"]
    var productCodeArray = ["Hello", "893", "8Z1", "1P9"]
    var productAccent:String!
    var productCode:String!
    var productColor:String!
    var mgpHues = [UIColor.brown,UIColor.gray, UIColor.brown, UIColor.white, UIColor(red: 0.898, green: 0.702, blue: 0, alpha: 1.0), UIColor.black, UIColor.red, UIColor.blue, UIColor.cyan, UIColor.orange, UIColor.darkGray]
    let mgpColors:Int = 11
    let pcColors:Int = 11
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionPicker.dataSource = self
        self.collectionPicker.delegate = self
        self.mgpCollectionView.dataSource = self
        self.mgpCollectionView.delegate = self
        self.powdercoatCollectionView.dataSource = self
        self.powdercoatCollectionView.delegate = self
        
        productCodeLabel.text = "Please Select a Collection"
    }
    
    func reloadProductLabel()
    {
        if productAccent != nil && productCode != nil && productColor != nil{
        productCodeLabel.text! = productCode+""+productColor+""+productAccent+""+"01"
        } else {
            productCodeLabel.text = "Choose Accent Colors"
        }
        
        chairImage.image = UIImage(named: "Configuration_"+""+productCodeLabel.text!+""+".png")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData.count
    }
    

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let URL:String
        productCode = productCodeArray[row]
        reloadProductLabel()
        
        switch row {
            
        case 0:
            
            URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1208_1-580x391.jpg"
            
        case 1:

            URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1010_1-580x391.jpg"
            
        case 2:
            
            URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1716_1-580x391.jpg"
            
        default:
            
            URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1709_1-580x391.jpg"
    }
        if let url = NSURL(string:URL){
            if let data = NSData(contentsOf: url as URL){
                chairImage.image = UIImage(data:data as Data)
                //chairImage.contentMode = UIViewContentMode(rawValue: 2)!
                chairImage.contentMode = .scaleAspectFit
            }}


    }
    
    func colorForIndexPath(indexPath: NSIndexPath) -> UIColor
    {
        
        let hueValue:UIColor = mgpHues[indexPath.row]
        
        return hueValue
        
    }
    
    
}
