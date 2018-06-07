//
//  Concentration.swift
//  Concentration
//
//  Created by Ahmad Razouki on 02/06/2018.
//  Copyright © 2018 Ahmad Razouki. All rights reserved.
//

import Foundation

class Concentration{
    // MARK: Model
    
    var cards = [Card]()
    //we need to keep a track on a card faceUp so we can look for a match (for the third case of chooseCard())
    // and because when we start the game there will be no card faceUp so it's better be OPTIONAL
    var indexOfOneAndOnlyFaceUpCard : Int?
    //     sfter declaring cards we need to let the user choses a card
    //     the parameter can be of type card but it's better to call the card by its index
    //     since it's an array of cards, more flexible
    func chooseCard(at index: Int){
        // playing the concentration here
        // ignoring the matched cards
        if !cards[index].isMatched{
            // case one: no card isFaceUp -> so we flip the card over to be faceUp that's all
            
            // we're unwrapping and checking if we didn't chose the already faceUp card
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                // if there's a match
                if cards[matchIndex].identifire == cards[index].identifire{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                // now after we checked for a match ubove ..  we need to flip another cards the following lines will just
                // current card we just clicked has to face up (after flipping 2 cards and checking if there's a match)
                cards[index].isFaceUP = true
                // because we don't have indexOfOneAndOnlyFaceUpCard anymore (we have 2 cards faceUp already)
                indexOfOneAndOnlyFaceUpCard = nil
                
            }else{
                // either no cards or 2 cards are faceUp -> so we need to turn the cards faceDown and  have the chosen card to be the indexOfOneAndOnlyFaceUpCard
                // we're turning every card faceDown
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUP = false
                }
                // we need to flip the chosen card to faceUP again
                cards[index].isFaceUP = true
                // and we need to assign back that this chosen card is the indexOfOneAndOnlyFaceUpCard agian
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    // this init will let the controller specify how many cards to play
    // whatever the controller passes as numberOfPairsOfCards we will put them in var cards = [Cards]()
    init(numberOfPairsOfCards: Int) {
        for identifier in 1...numberOfPairsOfCards{
            let card = Card(identifier: identifier)
            print("Identefier is ......\(identifier)")
            cards += [card,card]
        }
        // TODO: Shuffle the cards
        
        for shuffle in cards.indices{
            cards.swapAt(2, shuffle)
            
        }
    }
}
