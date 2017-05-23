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
            
            let cellImage = imageForMGPCollection(indexPath: indexPath as NSIndexPath)
            cell.mgpImageVIew.image = cellImage
            
            cell.mgpColorLabel.text = mgpAccents[indexPath.row]
            
            if (cell.mgpImageVIew.image == UIImage(named: "P50.jpg"))
            {
                cell.mgpColorLabel.textColor = UIColor.black
                
            }else{
                
                cell.mgpColorLabel.textColor = UIColor.white
                
            }
            
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pcCell", for: indexPath) as! pcCell
            
            let cellImage = imageForPCColorCollection(indexPath: indexPath as NSIndexPath)
            cell.pcImageView.image = cellImage
            
            cell.pcColorLabel.text = pcAccents[indexPath.row]
            
            if (cell.pcImageView.image == UIImage(named: "6.jpg") || cell.pcImageView.image == UIImage(named: "5.jpg") || cell.pcImageView.image == UIImage(named: "D.jpg"))
            {
                cell.pcColorLabel.textColor = UIColor.black
            }else{
            
            cell.pcColorLabel.textColor = UIColor.white
                
            }
            
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
    
    
    var pickerData = ["Collection:","Avant", "Bazza MGP Chair", "Plymouth Bay Table", "Plymouth Bay Bench", "36in Fire Table", "Jetset"]
    let mgpAccents = ["P10", "P30", "P40", "P50", "P60", "P70", "PR0", "PA0", "PQ0", "PM0", "PN0"]
    var mgpHues = [UIImage(named:"P10.jpg"), UIImage(named:"P30.jpg"), UIImage(named:"P40.jpg"), UIImage(named:"P50.jpg"), UIImage(named:"P60.jpg"), UIImage(named:"P70.jpg"), UIImage(named:"PR0.jpg"), UIImage(named:"PA0.jpg"), UIImage(named:"PQ0.jpg"), UIImage(named:"PM0.jpg"), UIImage(named:"PN0.jpg")]
    var pcAccents = ["K", "T", "J", "5", "6", "D", "8", "A", "L"]
    var productCodeArray = ["Hello", "893", "8Z1", "1P9", "1P1", "3F6", "1J7"]
    var productAccent:String!
    var productCode:String!
    var productColor:String!
    var pcCollColors = [UIImage(named:"K.jpg"), UIImage(named:"T.jpg"), UIImage(named:"J.jpg"), UIImage(named:"5.jpg"), UIImage(named:"6.jpg"), UIImage(named:"D"), UIImage(named:"8.jpg"), UIImage(named:"A.jpg"), UIImage(named:"L.jpg")]
    let mgpColors:Int = 11
    let pcColors:Int = 9
    
    var favoritedProductArray = ProductTableView()
    var favoriteProducts = [String]()
    
    //let imageURL = "https://www.dropbox.com/sh/ivwwuc1n579u96p/AACEIn1lzlwIc6ACnRLWhilWa?dl=0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionPicker.dataSource = self
        self.collectionPicker.delegate = self
        self.mgpCollectionView.dataSource = self
        self.mgpCollectionView.delegate = self
        self.powdercoatCollectionView.dataSource = self
        self.powdercoatCollectionView.delegate = self
        
        productCodeLabel.text = "Please Select a Collection"
        
        telescopeImage.image = UIImage(named:"telescope-Casual-square-logo.jpg")
    }
    
    func reloadProductLabel()
    {
        
        if productAccent != nil && productCode != nil && productColor != nil{
            
                productCodeLabel.text! = productCode+""+productColor+""+productAccent+""+"01"
                chairImage.image = UIImage(named: "Configuration_"+""+productCodeLabel.text!+""+".png")
            
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
    
    func imageForMGPCollection(indexPath: NSIndexPath) -> UIImage
    {
        
        let hueValue:UIImage = mgpHues[indexPath.row]!
        
        return hueValue
        
    }
    
   func imageForPCColorCollection(indexPath:NSIndexPath) -> UIImage
    {
        
        let pcCollImage:UIImage = pcCollColors[indexPath.row]!
        
        return pcCollImage
        
    }
    
    
}
