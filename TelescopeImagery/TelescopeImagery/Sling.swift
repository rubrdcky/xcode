//
//  Sling.swift
//  TelescopeImagery
//
//  Created by Jacob Warren on 5/16/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import Foundation
import UIKit

extension Sling: UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == pcCollectionView){
            return pcAccents.count
        }else{
            
            return slingPats.count //need sling array here
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if (collectionView == pcCollectionView){
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
            
        }else{
            
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "slingCell", for: indexPath) as! slingCell
            
            let cellImage = imageForSlingCollectionView(indexPath: indexPath as NSIndexPath)
            cell.patImageView.image = cellImage
            
            cell.patternNumberLabel.text = slingPats[indexPath.row]
            cell.patternNumberLabel.textColor = UIColor.black
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //let cell  = collectionView.cellForItem(at: indexPath)
        //cell?.layer.borderWidth = 4.0
        //cell?.layer.borderColor = UIColor.black.cgColor
        
        //print("Selected cell number \(slingPats[indexPath.row])"
        
        if (collectionView == slingCollectionView){
            slingPattern = String(slingPats[indexPath.row])
            reloadProductLabel()
        }else{
            
            productColor = String(pcAccents[indexPath.row])
            reloadProductLabel()
        }
        
    }
}

class Sling: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    
    @IBOutlet weak var pcCollectionView: UICollectionView!
    @IBOutlet weak var slingCollectionView: UICollectionView!
    @IBOutlet weak var collectionPicker: UIPickerView!
    @IBOutlet weak var telescopeImage: UIImageView!
    @IBOutlet weak var chairImage: UIImageView!
    @IBOutlet weak var slingProductCodeLabel: UILabel!
    
    @IBOutlet weak var slingFavoriteButton: UIButton!
    
    
    @IBAction func addfavoriteSling(_ sender: Any) {
        
        if (favoritedProductGlobal.contains(slingProductCodeLabel.text!))
        {
            print("Sorry Item Already in Favorite List")
            slingFavoriteButton.isHidden = true
            slingFavoriteButton.titleLabel?.text = ""
            
        }else if(slingProductCodeLabel.text == "Please Select a Collection" || slingProductCodeLabel.text == "Please Select Accent Colors"){
            
            print ("Invalid Item")
            
        }else{
            favoritedProductGlobal.append(slingProductCodeLabel.text!)
            
            print("added \(slingProductCodeLabel.text ?? "Nothing") to array")
            print("There are \(favoritedProductGlobal.count) Items in this array")
            slingFavoriteButton.titleLabel?.text = ""
            slingFavoriteButton.isHidden = true
        }
    }
    
    
    var patImage = slingCell()

    var pcCollColors = [UIImage(named:"K.jpg"), UIImage(named:"T.jpg"), UIImage(named:"J.jpg"), UIImage(named:"5.jpg"), UIImage(named:"6.jpg"), UIImage(named:"D"), UIImage(named:"8.jpg"), UIImage(named:"A.jpg"), UIImage(named:"L.jpg")]
    
    var pcAccents = ["K", "T", "J", "5", "6", "D", "8", "A", "L"]
    var slingPats = ["70D", "310", "365", "465"]
    var patPics = [UIImage(named:"70D.jpg"), UIImage(named:"310.jpg"), UIImage(named:"365.jpg"), UIImage(named:"465.jpg")]
    var patImages = [UIImage]()
    var productCode:String!
    var slingPattern:String!
    var productColor:String!
    
    var pickerData = ["Colection:", "Dune Chaise", "Belle Isle Sling"]
    var productCodeArray = ["Hello","9N3", "L17"]
    
    override func viewDidLoad() {
    
        self.pcCollectionView.dataSource = self
        self.pcCollectionView.delegate = self
        self.slingCollectionView.dataSource = self
        self.slingCollectionView.delegate = self
        self.collectionPicker.delegate = self
        self.collectionPicker.dataSource = self
        
        reloadProductLabel()
    }
    
    func reloadProductLabel()
    {
        
        if productColor != nil && productCode != nil && slingPattern != nil{
            
            slingProductCodeLabel.text! = productCode+""+productColor+""+slingPattern+""+"01"
            chairImage.image = UIImage(named: "Configuration_"+""+slingProductCodeLabel.text!+""+".png")

            self.telescopeImage.image = nil
            
        } else {
            
            slingProductCodeLabel.text = "Please Select Accent Colors"
            telescopeImage.image = UIImage(named:"telescope-Casual-square-logo.jpg")
        }
        
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
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        productCode = productCodeArray[row]
        reloadProductLabel()
        
    }
    
    func imageForPCColorCollection(indexPath:NSIndexPath)-> UIImage
    {
        let pcCollPic:UIImage = pcCollColors[indexPath.row]!
        
        return pcCollPic
    }
    
    func imageForSlingCollectionView(indexPath:NSIndexPath) -> UIImage
    {
        
        let patternImage:UIImage = patPics[indexPath.row]!
        
        return patternImage
        
    }
}
