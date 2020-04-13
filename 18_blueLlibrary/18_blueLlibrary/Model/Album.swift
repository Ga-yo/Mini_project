//
//  Album.swift
//  18_blueLlibrary
//
//  Created by 이가영 on 2020/04/13.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

struct Album {
    let title: String
    let artist: String
    let genre: String
    let coverUrl: String
    let year: String
}

extension Album: CustomStringConvertible{
    var description: String{
        return "title: \(title)" +
          " artist: \(artist)" +
          " genre: \(genre)" +
          " coverUrl: \(coverUrl)" +
        " year: \(year)"
    }
}
