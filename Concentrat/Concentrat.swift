//
//  Concentrat.swift
//  Concentrat
//
//  Created by ha tuong do on 11/26/19.
//  Copyright © 2019 alpine. All rights reserved.
//

import Foundation

// when build a class, think about what public API it has
// API is list of methods and instances in the class
// public API means you allow other classes to call this class's methods
// or get access to public instances
// public API basically means how you use this class

class Concentrat
{
    // what are essentials to Concentrat class ?
    // var cards: Array<Card>       // this has no initializer
    // var cards: Array<Card> = []  // this has initializer
    // var cards = Array<Card>()    // "=" means we are creating an array of Card
                                    // "Array<Card>" is a type
    var cards = [Card]()            // <- equiv to   var cards = Array<Card>()
    
    // allow user to flip/choose card
    func chooseCard (at index: Int) { // index into cards array, let user choose card by specifying index number into cards array
        
        
    }
}
