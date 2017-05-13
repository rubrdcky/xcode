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
        return mgpColors
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mgpCell", for: indexPath) as! mgpCell
        let cellColor = colorForIndexPath(indexPath: indexPath as NSIndexPath)
        cell.backgroundColor = cellColor
        
        if (cell.mgpColorLabel.text == "P50")
        {
            cell.mgpColorLabel.text = mgpAccents[indexPath.row]
            cell.mgpColorLabel.textColor = UIColor.black
            return cell
            
        }else{
            
            cell.mgpColorLabel.textColor = UIColor.white
            cell.mgpColorLabel.text = mgpAccents[indexPath.row]
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Selected cell number \(mgpAccents[indexPath.row])")
    }
    
}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var chairImage: UIImageView!
    @IBOutlet weak var collectionPicker: UIPickerView!
    @IBOutlet weak var mgpCollectionView: UICollectionView!
    @IBOutlet weak var powdercoatCollectionView: UICollectionView!
    
    var pickerData = ["Collection:","Avant", "Bazza MGP Chair", "Playmouth Bay"]
    var mgpAccents = ["P10", "P30", "P40", "P50", "P60", "P70", "PR0", "PA0", "PQ0", "PM0", "PN0"]
    var mgpHues = [UIColor.brown,UIColor.gray, UIColor.brown, UIColor.white, UIColor.yellow, UIColor.black, UIColor.red, UIColor.blue, UIColor.cyan, UIColor.orange, UIColor.darkGray]
    let mgpColors:Int = 11
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionPicker.dataSource = self
        self.collectionPicker.delegate = self
        self.mgpCollectionView.dataSource = self
        self.mgpCollectionView.delegate = self
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
        
        switch row {
            
        case 0:
            
            URL = "https://www.telescopecasual.com/wp-content/uploads/catalogarchive/1956.jpg"
            
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
            }}


    }
    
    func colorForIndexPath(indexPath: NSIndexPath) -> UIColor
    {
        if indexPath.row >= mgpColors
        {
            return UIColor.black
        }
        
        //let hueValue:CGFloat = CGFloat(indexPath.row)/CGFloat(mgpColors)
        let hueValue:UIColor = mgpHues[indexPath.row]
        
        return hueValue
        
    }
    
    
}
