//
//  ViewController.swift
//  Concentration
//
//  Created by Ahmad Razouki on 01/06/2018.
//  Copyright © 2018 Ahmad Razouki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // we need to specify how many cards we need
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var flipCount:Int = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
            
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        // depends on whatever button is pressed of the array of buttons
        if let cardNumber = cardButtons.index(of: sender){
            // flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            // we're letting the model chose the card and the model will upate the view
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            //print("cardNumber: \(cardNumber)")
            //print("This is a ghost!")
        }else{
            print("this card does not belong to the array of buttons!")
        }
    }
    
    func updateViewFromModel() {
        // this func will look through the cards and make sure all the card buttons match , faceUp..
        // we need to lookup the button index in the Card array
        for index in cardButtons.indices{
            //print("indices are ... \(index)")
            // we're paasing the index after iterating on array of buttons to the gane.card so the model is synced with the array of buttons because the model has an array of cards
            let button = cardButtons[index]
            let card = game.cards[index]
           // print("card inside cardButtons ...\(card)")
            
            if card.isFaceUP{
                button.setTitle(emoji(for: card),for:
                UIControlState.normal)
                    button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    var emojiChoices = ["🦇","😱","🙀","😈","👻","🍭","🍬","🍎"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String{
        if emoji[card.identifire] == nil, emojiChoices.count > 0{
            let randomIndex = Int (arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifire] = emojiChoices.remove(at: randomIndex)
       
        }
        return emoji[card.identifire] ?? "?"
    }

}

