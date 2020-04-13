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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit(){
        backgroundColor = .black
        
        coverImageView = UIImageView()
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
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
