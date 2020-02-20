//
//  ViewController.swift
//  Card_game
//
//  Created by 이가영 on 2020/02/20.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game: Concentration = Concentration()
    var number: Int = 0
    
    var emoji = ["👻", "🎃", "👻", "🎃"]
    @IBAction func ghost_but(_ sender: UIButton) {
        flipcount()
        if let cardnumber = cardarray.index(of: sender){
            flipCard(withEmoji: emoji[cardnumber], on: sender)
        }else {
            print("was not in card")
        }
        
    }
    
    @IBOutlet var cardarray: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.7121074796, green: 0.5914553404, blue: 1, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    @IBOutlet weak var numbercounting: UILabel!
    
    func flipcount(){
        number+=1
        numbercounting.text = "Flip : \(number)"
    }
}

