//
//  ViewController.swift
//  TelescopeImagery
//
//  Created by Jacob Warren on 5/13/17.
//  Copyright © 2017 Jacob Warren. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var chairImage: UIImageView!
    @IBOutlet weak var collectionPicker: UIPickerView!
    @IBOutlet weak var mgpCollectionView: UICollectionView!
    @IBOutlet weak var powdercoatCollectionView: UICollectionView!
    
    var pickerData = ["Avant", "Bazza MGP Chair", "Playmouth Bay"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionPicker.dataSource = self
        self.collectionPicker.delegate = self

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
            
            URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/466_1-580x391.jpg"
            
        case 1:
            
            URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1116_1-580x391.jpg"
            
        default:
            
            URL = "https://www.telescopecasual.com/wp-content/uploads/IMAGE_MASTER/PRODUCTS/1709_1-580x391.jpg"
    }
        if let url = NSURL(string:URL){
            if let data = NSData(contentsOf: url as URL){
                chairImage.image = UIImage(data:data as Data)
                chairImage.contentMode = UIViewContentMode(rawValue: 2)!
            }}


}
}
