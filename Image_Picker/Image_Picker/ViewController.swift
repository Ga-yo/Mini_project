//
//  ViewController.swift
//  Image_Picker
//
//  Created by 이가영 on 2020/02/18.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var Array: [String] = ["honey.jpeg", "original.jpeg", "bboring.jpeg"]
    var selectRow = 0
    var imageArray = [UIImage?]()
    var name: [String] = ["허니콤보와 엽떡", "엽떡", "뿌링클과 엽떡"]
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var imageView:UIImageView!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array[row]
    }
    
   func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
           return 1
       }
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectRow = row
        let image = UIImage(named: Array[selectRow])
        imageView.image = image
        textlabel.text = name[selectRow]
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textlabel.text = "None"
    }


}

