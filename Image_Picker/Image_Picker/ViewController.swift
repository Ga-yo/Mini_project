//
//  ViewController.swift
//  Image_Picker
//
//  Created by 이가영 on 2020/02/18.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let Max = 4
    var imageArray = ["honey.jpeg", "original.jpeg", "bboring.jpeg"]
    var imageArrayfinal = [UIImage?]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Max
    }//컴포넌트 개수
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageArray.count
    }//피커 뷰 개수
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var textlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        for i in 0 ..< Max{
            let image = UIImage(named: imageArray[i])
            imageArrayfinal.append(image)
        }
        textlabel.text = imageArray[0]
        ImageView.image = imageArrayfinal[0]
    }


}

