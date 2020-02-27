 //
//  ConcentrationThemeChooserViewController.swift
//  Card_game
//
//  Created by 이가영 on 2020/02/27.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    let themes = [
        "Sports" : "⚽️🏀🏈⚾️🥎🏐🏉🎱🏓🏂🎳⛳️",
        "Animals" : "🐶🐔🦊🐼🦀🐪🐓🐋🐙🦄🙊",
        "Faces" : "😀😂😎😩😰😴🙄🤔😘😷",
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme"{
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                if let cvc = segue.destination as? ConcentrationViewController{
                    cvc.theme = theme
                }
            }
        }
    }

}
