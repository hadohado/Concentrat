//
//  Card.swift
//  Concentrat
//
//  Created by ha tuong do on 11/26/19.
//  Copyright © 2019 alpine. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int  // what is this card identity

    static var idFactory = 0
    
    static func getUniqueId() -> Int {
        idFactory += 1 // dont need Card. since we are inside static method
        return idFactory
        // Card.idFactory += 1
        // return Card.idFactory
    }
    
    init() {
        self.identifier = Card.getUniqueId()
 
    }
}

/*
 
 struct Card {
     var isFaceUp = false
     var isMatched = false
     var identifier: Int  // what is this card identity
     // this card is UI-independent, so doesn't need emoji
     init(identifier: Int) {
         self.identifier = identifier
         // ..........   =     ^
         //                    |
         //                 parameter of init()
         
     }
 }
 
 */
// version 1: no initializer
//struct Card {
//    var isFaceUp = false
//    var isMatched = false
//    var identifier: Int  // what is this card identity
//    // this card is UI-independent, so doesn't need emoji
//}
