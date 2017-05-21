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
            let cellColor = colorForMGPCollection(indexPath: indexPath as NSIndexPath)
            cell.backgroundColor = cellColor
            if (cellColor == black || cellColor == kona || cellColor == navy)
            {
                cell.mgpColorLabel.textColor = UIColor.white
            }else{
                
               cell.mgpColorLabel.textColor = UIColor.black
            }
            cell.mgpColorLabel.text = mgpAccents[indexPath.row]
            
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pcCell", for: indexPath) as! pcCell
            let cellColor = colorForPCColorCollection(indexPath: indexPath as NSIndexPath)
            cell.backgroundColor = cellColor
            
            if (cellColor == black || cellColor == kona || cellColor == agedBronze)
            {
                cell.pcColorLabel.textColor = UIColor.white
            }else{
                cell.pcColorLabel.textColor = UIColor.black
            }

            cell.pcColorLabel.text = pcAccents[indexPath.row]
            
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
    @IBOutlet weak var telescopeImage: UIImageView!
    @IBOutlet weak var collectionPicker: UIPickerView!
    @IBOutlet weak var mgpCollectionView: UICollectionView!
    @IBOutlet weak var powdercoatCollectionView: UICollectionView!
    @IBOutlet weak var productCodeLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBAction func touchUpInside(_ sender: Any) {
        
        //favoritedProductArray.favoritedProduct.append(productCodeLabel.text!)
        favoritedProductGlobal.append(productCodeLabel.text!)
        print("added \(productCodeLabel.text ?? "Nothing") to array")
        print("There are \(favoritedProductGlobal.count) Items in this array")
        
    }
    
    var kona:UIColor = UIColor(red: 0.2588, green: 0.1569, blue: 0.0196, alpha: 1.0)
    var beachwood:UIColor = UIColor(red: 0.439, green: 0.439, blue: 0.439, alpha: 1.0)
    var graphite:UIColor = UIColor(red: 0.4863, green: 0.4118, blue: 0.1451, alpha: 1)
    var white = UIColor.white
    var desert:UIColor = UIColor(red: 0.8863, green: 0.7255, blue: 0, alpha: 1.0)
    var black = UIColor.black
    var red = UIColor.red
    var atlantis:UIColor = UIColor(red: 0.0824, green: 0.2275, blue: 0.5686, alpha: 1.0)
    var aqua:UIColor = UIColor(red: 0, green: 0.8157, blue: 1, alpha: 1.0)
    var mango:UIColor = UIColor(red: 1, green: 0.4, blue: 0, alpha: 1.0)
    var navy:UIColor = UIColor(red: 0.051, green: 0.149, blue: 0.3098, alpha: 1.0)
    

    var agedBronze:UIColor = UIColor(red: 0.3294, green: 0.1529, blue: 0.0627, alpha: 1.0)
    var silver:UIColor = UIColor(red: 0.7176, green: 0.7098, blue: 0.6745, alpha: 1.0)
    var snow:UIColor = UIColor(red: 0.9098, green: 0.898, blue: 0.8549, alpha: 1.0)
    
    
    var pickerData = ["Collection:","Avant", "Bazza MGP Chair", "Plymouth Bay Table", "Plymouth Bay Bench", "36in Fire Table", "Jetset"]
    let mgpAccents = ["P10", "P30", "P40", "P50", "P60", "P70", "PR0", "PA0", "PQ0", "PM0", "PN0"]
    var pcAccents = ["K", "T", "J", "5", "6", "D", "8", "A", "L"]
    var productCodeArray = ["Hello", "893", "8Z1", "1P9", "1P1", "3F6", "1J7"]
    var productAccent:String!
    var productCode:String!
    var productColor:String!
    var mgpHues = [UIColor]()
    var pcCollColors = [UIColor]()
    let mgpColors:Int = 11
    let pcColors:Int = 9
    
    var favoritedProductArray = ProductTableView()
    var favoriteProducts = [String]()
    
    let imageURL = "https://www.dropbox.com/sh/ivwwuc1n579u96p/AACEIn1lzlwIc6ACnRLWhilWa?dl=0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mgpHues = [kona, beachwood, graphite, white, desert, black, red, atlantis, aqua, mango, navy]
        
        pcCollColors = [kona, beachwood, graphite, white, snow, desert, black, agedBronze, silver]
        
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
                chairImage.image = UIImage(named: "Configuration_"+""+productCodeLabel.text!+""+".png")
            
            /*if let url = NSURL(string:imageURL){
                if let data = NSData(contentsOf: url as URL){
                    chairImage.image = UIImage(data:data as Data)
                }
            }*/
                self.telescopeImage.image = nil
            
        } else {
            
                productCodeLabel.text = "Please Select Accent Colors"
                telescopeImage.image = UIImage(named:"telescope-Casual-square-logo.jpg")
        }
        
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
        
        //let URL:String = " "
        //var URLVariance:String
        productCode = productCodeArray[row]
        reloadProductLabel()
        
        //URLVariance = "Configuration_"+""+productCodeLabel.text!+""+".png"
        
        /*switch row {
        
        case 0:
            
            URL = "https://myroomsfurnituregallery.com/sites/default/files/styles/brand_page/public/brands/telescope-Casual-square-logo.jpg?itok=K5Hp1ZyA"
            
        case 1:

            URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1010_1-580x391.jpg"
            
        case 2:
            
            URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1716_1-580x391.jpg"
            
        default:
            URL = "https://myroomsfurnituregallery.com/sites/default/files/styles/brand_page/public/brands/telescope-Casual-square-logo.jpg?itok=K5Hp1ZyA"
            
    }
        if let url = NSURL(string:URL){
            if let data = NSData(contentsOf: url as URL){
                chairImage.image = UIImage(data:data as Data)
                //chairImage.contentMode = UIViewContentMode(rawValue: 2)!
                //chairImage.contentMode = .scaleAspectFit
            }}*/


    }
    
    func colorForMGPCollection(indexPath: NSIndexPath) -> UIColor
    {
        
        let hueValue:UIColor = mgpHues[indexPath.row]
        
        return hueValue
        
    }
    
   func colorForPCColorCollection(indexPath:NSIndexPath) -> UIColor
    {
        
        let pcCollPic:UIColor = pcCollColors[indexPath.row]
        
        return pcCollPic
        
    }
    
    
}
