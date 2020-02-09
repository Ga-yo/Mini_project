// 여기서는 title, content, isComplete의 변수를 담을 클래스를 만든다
//  DataClass.swift
//  Todobox
//
//  Created by 이가영 on 2020/02/09.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

struct TodoList{
    var title: String = ""
    var content: String?
    var isComplete: Bool = false
    
    init(title: String = "", content: String?, isComplete: Bool = false){
        self.title = title
        self.content = content
        self.isComplete = isComplete
    }
    
}
