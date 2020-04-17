//
//  LibraryAPI.swift
//  18_blueLlibrary
//
//  Created by 이가영 on 2020/04/14.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation
import UIKit
//앨범을 관리하기 위한 진입점(Singleton 패턴)ㅌ
final class LibraryAPI{
    static let share = LibraryAPI()
    
    
    private init(){ //외부에서 새 인스턴스 작성 X
           NotificationCenter.default.addObserver(self, selector: #selector(downloadImage(with:)), name: .BLDownloadImage, object: nil)

       }
    
    private let persistencyManager = PersistencyManager()
    private let httpClient = HTTPClient()
    private let isOnline = false // 업데이트 여부
    
    func getAlbums() -> [Album] {
      return persistencyManager.getAlbums()
    }
      
    func ​addAlbum(_ album: Album, at index: Int) {
        persistencyManager.addAlbum(album, at: index)
        if isOnline{
            httpClient.postRequest("/api/addAlbum", body: album.description)
        }
    }
    
    func ​deleteAlbum(at index: Int) {
        persistencyManager.deleteAlbum(at: index)
        if isOnline{
            httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
        }
    }
    
    @objc func downloadImage(with notification: Notification) {
      guard let userInfo = notification.userInfo,
        let imageView = userInfo["imageView"] as? UIImageView,
        let coverUrl = userInfo["coverUrl"] as? String,
        let filename = URL(string: coverUrl)?.lastPathComponent else {
          return
      }
      
        if let savedImage = persistencyManager.​getImage(with: filename) {
        imageView.image = savedImage
        return
      }
      
      DispatchQueue.global().async {
        let downloadedImage = self.httpClient.downloadImage(coverUrl) ?? UIImage()
        DispatchQueue.main.async {
          imageView.image = downloadedImage
          self.persistencyManager.saveImage(downloadedImage, filename: filename)
        }
      }
    }

}
