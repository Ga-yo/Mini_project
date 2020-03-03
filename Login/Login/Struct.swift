//
//  Struct.swift
//  Login
//
//  Created by 이가영 on 2020/03/01.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

class UserInfo{
    
    
    struct User {
        let Name: String
        let Email: String
        let Password: String
    }

    var userlist: [User] = [User(Name: "이가영", Email: "39812@naver.com", Password: "dlrkdud03")]

    func checkinfo(email: String, pw: String) -> Bool{
        for user in userlist{
            if user.Email == email && user.Password == pw{
                return true
            }
        }
        return false
    }

//func addUser(name: String, email: String, password: String){
//    let new = User(Name: name, Email: email, Password: password)
//
//    userlist.append(new)
//}
}
