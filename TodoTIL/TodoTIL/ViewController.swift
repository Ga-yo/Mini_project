//
//  ViewController.swift
//  TodoTIL
//
//  Created by 이가영 on 2020/03/10.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var adress: UITextField!
    @IBOutlet weak var Where: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var Donebtu: UIButton!
    @IBOutlet weak var canclebtu: UIButton!
    
    var usermanager: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func save(_ sender: UIButton){
        let formatter = DateFormatter()
        let time = formatter.string(from: datePicker.date)
            
        let name = Name.text!
        let Adress = adress.text!
        let description = Where.text!
            
        let List: User = User(name: name, adress: Adress, description: description, time: time)
            
        list.append(List)
    }
    
    @IBAction func cancel(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}

