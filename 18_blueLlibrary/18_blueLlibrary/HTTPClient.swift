//
//  HTTPClient.swift
//  18_blueLlibrary
//
//  Created by 이가영 on 2020/04/13.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation
import UIKit

class HTTPClient{
    @discardableResult func getRequest(_ url: String) -> AnyObject {
      return Data() as AnyObject
    }
    
    @discardableResult func postRequest(_ url: String, body: String) -> AnyObject {
      return Data() as AnyObject
    }
    
    func downloadImage(_ url: String) -> UIImage? {
      let aUrl = URL(string: url)
      guard let data = try? Data(contentsOf: aUrl!),
        let image = UIImage(data: data) else {
          return nil
      }
      return image
    }
}
