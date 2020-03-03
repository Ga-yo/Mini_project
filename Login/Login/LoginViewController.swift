//
//  LoginViewController.swift
//  Login
//
//  Created by 이가영 on 2020/03/01.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import Firebase

var Userlogin = UserInfo()

class LoginViewController: UIViewController {

    // 변수는 viewController함수의 가장 위에 위치하는게 일반적!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var checkbutton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Auth.auth().currentUser != nil{
            email.placeholder = "이미 로그인 된 상태입니다."
            password.placeholder = "이미 로그인 된 상태입니다."
        }
    }
    
    @IBAction func Check(_ sender: Any) {
        guard let loginemail = email.text else {return}
        guard let loginpw = password.text else {return}
        Auth.auth().signIn(withEmail: loginemail, password: loginpw) { (user, error) in

//            if checkbutton.setTitle("로그아웃", for: .normal){
//
//            }
            if user != nil{
                        let alert = UIAlertController(title: "알림", message: "로그인 성공", preferredStyle: UIAlertController.Style.alert)
                            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                        
                            alert.addAction(okAction)
                self.present(alert, animated: false, completion: nil)
                
                    }

                    else{
                let alert = UIAlertController(title: "알림", message: "로그인 실패", preferredStyle: UIAlertController.Style.alert)
                            let noAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                
                            alert.addAction(noAction)
                self.present(alert, animated: false, completion: nil)
                    }
            

              }
       

//        if Userlogin.checkinfo(email: loginemail, pw: loginpw) == true{
//            let alert = UIAlertController(title: "알림", message: "로그인 성공", preferredStyle: UIAlertController.Style.alert)
//            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
//
//            alert.addAction(okActiron)
//            present(alert, animated: false, completion: nil)
//        }else{
//            let alert = UIAlertController(title: "알림", message: "로그인 실패", preferredStyle: UIAlertController.Style.alert)
//            let noAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
//
//            alert.addAction(noAction)
//            present(alert, animated: false, completion: nil)
//        }
       
        
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
