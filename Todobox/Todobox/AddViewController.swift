//
//  AddViewController.swift
//  Todobox
//
//  Created by 이가영 on 2020/02/09.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 0.3
        textView.layer.cornerRadius = 2.0
        textView.clipsToBounds = true
    }
    
    @IBAction func backitem(_ sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func doneitem(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBOutlet weak var textLabel: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
