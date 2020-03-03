//
//  SignUpViewController.swift
//  Login
//
//  Created by 이가영 on 2020/03/01.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import Firebase

var User = UserInfo()
class SignUpViewController: UIViewController {
    @IBOutlet weak var Nametext: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var doublecheck: UITextField!
//    @IBOutlet weak var pwcheck: UIButton!
//
//    @IBAction func pwcheck(_ sender: UIButton) {
//        guard let userP = passwordtext.text else {return}
//        guard let userC = doublecheck.text else {return}
//
//        //비밀번호와 재확인 text가 같다면 alert띄우기
//        if userP == userC {
//            let alerts = UIAlertController(title: "성공", message: "비밀번호 확인 성공", preferredStyle: UIAlertController.Style.alert)
//            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
//            alerts.addAction(okAction)
//            present(alerts, animated: false, completion: nil)
//        }else{
//            let alertf = UIAlertController(title: "이런!", message: "다시 시도해주세요.1", preferredStyle: UIAlertController.Style.alert)
//            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
//
//            alertf.addAction(okAction)
//            present(alertf, animated: false, completion: nil)
//        }
//    }
    
    
    @IBAction func Signinbut(_ sender: UIButton) {
        //비밀번호와 재확인 text가 같다면 alert띄우기
        Auth.auth().createUser(withEmail: emailtext.text!, password: passwordtext.text!
                ) { (user, error) in
                    if user !=  nil{
                        let alertss = UIAlertController(title: "축하드립니다", message: "회원가입 성공", preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                        alertss.addAction(okAction)
                        self.present(alertss, animated: false, completion: nil)
                    }
                    else{
                        let alertff = UIAlertController(title: "이런!", message: "다시 시도해주세요.2", preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                        
                        alertff.addAction(okAction)
                        self.present(alertff, animated: false, completion: nil)
                    }
                }
        //구조체 User의 정보를 추가하는 함수 호출
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
