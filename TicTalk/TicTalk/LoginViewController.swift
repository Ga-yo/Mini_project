//
//  LoginViewController.swift
//  TicTalk
//
//  Created by 이가영 on 2020/06/08.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signIn: UIButton!
    
    let remoteConfig = RemoteConfig.remoteConfig()
    var color: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let stateBar = UIView()
        self.view.addSubview(stateBar)
        stateBar.snp.makeConstraints { (m) in
            m.right.top.left.equalTo(self.view)
            m.height.equalTo(20)
            
        }
        
        color = remoteConfig["splash_background"].stringValue
        
        stateBar.backgroundColor = UIColor(hexString: color)
        loginButton.backgroundColor = UIColor(hexString: color)
        signIn.backgroundColor = UIColor(hexString: color)
        
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
