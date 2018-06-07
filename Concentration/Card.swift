//
//  Card.swift
//  Concentration
//
//  Created by Ahmad Razouki on 02/06/2018.
//  Copyright © 2018 Ahmad Razouki. All rights reserved.
//

import Foundation

//we're declaring Card as struct because struct doesn't allow inheritance and we don't need inheritance
struct Card{
    
    var isFaceUP = false
    var isMatched = false
    // make the card unique
    var identifire: Int
    static var identefierFactory = 0
    //
    static func getUniqueIdentifier() -> Int{
        // we can access static member from another static member without specifying the type , not like the case in init func
        // we're simply setting the identifierFactory here so we can  get it in init()
        identefierFactory += 1
        print("and the identefier from getUniqueIdentifier() is ....\(identefierFactory)")
        return identefierFactory
    }
    // we only care about the identifier when we instantiate this struct, without this init , the caller will get the default init which is setting all the vars of this struct , this is the case with structs
    init(identifier  : Int) {
        // = Card.getUniqueIdentefier is to access the static var because even though we're in the same struct we need to specify the type which is Card to access the static members
        self.identifire = Card.getUniqueIdentifier()
    }
}
