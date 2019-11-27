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
    // this card is UI-independent, so doesn't need emoji
    init(identifier: Int) {
        self.identifier = identifier
        // ..........   =     ^
        //                    |
        //                 parameter of init()
        
    }
}

// version 1: no initializer
//struct Card {
//    var isFaceUp = false
//    var isMatched = false
//    var identifier: Int  // what is this card identity
//    // this card is UI-independent, so doesn't need emoji
//}
