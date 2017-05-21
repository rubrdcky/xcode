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
        }else{
            
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "slingCell", for: indexPath) as! slingCell
            
            let cellImage = imageForSlingCollectionView(indexPath: indexPath as NSIndexPath)
            cell.patImageView.image = cellImage
            
            cell.patternNumberLabel.text = slingPats[indexPath.row]
            cell.patternNumberLabel.textColor = UIColor.black
            
            return cell
        }
    }
}

class Sling: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    
    @IBOutlet weak var pcCollectionView: UICollectionView!
    
    @IBOutlet weak var slingCollectionView: UICollectionView!
    
    @IBOutlet weak var collectionPicker: UIPickerView!
    
    
    @IBOutlet weak var slingProductCodeLabel: UILabel!
    
    var patImage = slingCell()
    
    var kona:UIColor = UIColor(red: 0.2588, green: 0.1569, blue: 0.0196, alpha: 1.0)
    var beachwood:UIColor = UIColor(red: 0.439, green: 0.439, blue: 0.439, alpha: 1.0)
    var graphite:UIColor = UIColor(red: 0.4863, green: 0.4118, blue: 0.1451, alpha: 1)
    var white = UIColor.white
    var desert:UIColor = UIColor(red: 0.8863, green: 0.7255, blue: 0, alpha: 1.0)
    var black = UIColor.black
    var agedBronze:UIColor = UIColor(red: 0.3294, green: 0.1529, blue: 0.0627, alpha: 1.0)
    var silver:UIColor = UIColor(red: 0.7176, green: 0.7098, blue: 0.6745, alpha: 1.0)
    var snow:UIColor = UIColor(red: 0.9098, green: 0.898, blue: 0.8549, alpha: 1.0)

    var pcCollColors = [UIColor]()
    
    var pcAccents = ["K", "T", "J", "5", "6", "D", "8", "A", "L"]
    var slingPats = ["70D", "310", "365", "465"]
    var patPics = [UIImage(named:"70D.jpg"), UIImage(named:"310.jpg"), UIImage(named:"365.jpg"), UIImage(named:"465.jpg")]
    var patImages = [UIImage]()
    var productCode:String!
    
    var pickerData = ["Colection:", "Dune Chaise", "Belle Isle Sling"]
    var productCodeArray = ["Hello","9N3", "L17"]
    
    override func viewDidLoad() {
        
        pcCollColors = [kona, beachwood, graphite, white, snow, desert, black, agedBronze, silver]
        
        self.pcCollectionView.dataSource = self
        self.pcCollectionView.delegate = self
        self.slingCollectionView.dataSource = self
        self.slingCollectionView.delegate = self
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
        
    }
    
    func colorForPCColorCollection(indexPath:NSIndexPath)-> UIColor
    {
        let pcCollPic:UIColor = pcCollColors[indexPath.row]
        
        return pcCollPic
    }
    
    func imageForSlingCollectionView(indexPath:NSIndexPath) -> UIImage
    {
        
        let patternImage:UIImage = patPics[indexPath.row]!
        
        return patternImage
        
    }
}
