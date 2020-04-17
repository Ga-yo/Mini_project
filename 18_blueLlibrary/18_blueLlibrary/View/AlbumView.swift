//
//  AlbumView.swift
//  18_blueLlibrary
//
//  Created by 이가영 on 2020/04/13.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class AlbumView: UIView {

    private var coverImageView: UIImageView!
    private var indicatorView: UIActivityIndicatorView!
    private var valueObservation: NSKeyValueObservation!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    init(frame: CGRect, coverUrl: String) {
      super.init(frame: frame)
      commonInit()
        NotificationCenter.default.post(name: .BLDownloadImage, object: self, userInfo: ["imageView": coverImageView ?? nil!, "coverUrl" : coverUrl])
    }
    
    private func commonInit(){
        backgroundColor = .black
        
        coverImageView = UIImageView()
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        
        valueObservation = coverImageView.observe(\.image, options: [.new]) { [unowned self] observed, change in
          if change.newValue is UIImage {
              self.indicatorView.stopAnimating()
          }
        }

        addSubview(coverImageView)
        
        indicatorView = UIActivityIndicatorView()
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.style = .whiteLarge
        indicatorView.startAnimating()
        addSubview(indicatorView)
        
        NSLayoutConstraint.activate([ coverImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
             coverImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
             coverImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
             coverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
             indicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             indicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
    }
    
    func highlightAlbum(_ didHighlightView: Bool){
        if didHighlightView == true{
            backgroundColor = .white
        } else {
            backgroundColor = .black
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
