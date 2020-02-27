//
//  ViewController.swift
//  Card_game
//
//  Created by 이가영 on 2020/02/20.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {

    private lazy var game = Concentration(numberOfPairsOfCards: (cardarray.count + 1)/2)
    var number: Int = 0
    
   // private var emojiChoices = ["🦇", "😱", "🙀", "👿", "🎃", "👻", "🍭", "🍬", "🍎"]
    private var emojiChoices = "🦇😱🙀👿🎃👻🍭🍬🍎"
    
    private var emoji = [Card:String]()
    
    @IBAction private func ghost_but(_ sender: UIButton) {
        flipcount()
        if let cardnumber = cardarray.firstIndex(of:sender){
            game.chooseCard(at: cardnumber)
            updateviewfrommodel()
        }else {
            print("was not in card")
        }
        
    }
    
    var theme: String?{
        didSet{
            emojiChoices = theme ?? ""
            emoji = [:] //재설정
            updateviewfrommodel()
        }
    }
    
    func updateviewfrommodel(){
        if cardarray != nil{
        for index in cardarray.indices{
            let button = cardarray[index]
            let card = game.cards[index]
            if card.isFaceup{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 0.7121074796, green: 0.5914553404, blue: 1, alpha: 1)
            }
        }
    }
    }
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
    
    @IBOutlet private var cardarray: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var numbercounting: UILabel!
    
    private func flipcount(){
        number+=1
        numbercounting.text = "Flip : \(number)"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
  
