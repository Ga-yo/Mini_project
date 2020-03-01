//
//  LoginViewController.swift
//  Login
//
//  Created by 이가영 on 2020/03/01.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

var Userlogin = UserInfo()

class LoginViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func Check(_ sender: Any) {
        guard let loginemail = email.text else {return}
        guard let loginpw = password.text else {return}
        
        if Userlogin.checkinfo(email: loginemail, pw: loginpw) == true{
//            let alert = UIAlertController(title: "알림", message: "로그인 성공", preferredStyle: UIAlertController.Style.alert)
//            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
//
//            alert.addAction(okAction)
//            present(alert, animated: false, completion: nil)
        }else{
            let alert = UIAlertController(title: "알림", message: "로그인 실패", preferredStyle: UIAlertController.Style.alert)
            let noAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            
            alert.addAction(noAction)
            present(alert, animated: false, completion: nil)
        }
       
        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "MainViewController")
        self.present(uvc, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
