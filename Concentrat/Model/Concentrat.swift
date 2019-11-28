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
    var cards = [Card]()  // <- equiv to var cards = Array<Card>()
    
    // we need optional var here since there can be 0, 1 or 2 cards faced up
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    // allow user to flip/choose card
    func chooseCard (at index: Int) {
        // write code to play game here ! 1:01
        // when a card is chosen, ignore card that has been matched
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if card match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true // card you choose
                }
                cards[index].isFaceUp = true // your chosen card faced up again
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no card or 2 cards are faced up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true // your chosen card faced up again
                indexOfOneAndOnlyFaceUpCard = index
            }
            
            // 3 cases
            // 1- no card are faced up, then flip chosen card over
            // 2- 2 cards are faced up, either matching or not
            //    if match: flip both cards faced down
            // 3- 1 card faced up already, I choose another card, now I need a match
            // (we have to really work if there is 1 card faced up)
        }
        
        // if cards[index].isFaceUp {
        //    cards[index].isFaceUp = false
        // } else {
        //    cards[index].isFaceUp = true
        // }
    }
     
    init (numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]     // copy #2 and #3 of card
        }
        // TODO: shuffle the cards (homework)
        //       need to know value type array or value type
        cards.shuffle()
        // print("class Concentrat TODO cards = ", cards)
    }
}

/* before cards.shuffle()

class Concentrat TODO cards =  [Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 1), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 1), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 2), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 2), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 3), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 3), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 4), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 4), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 5), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 5), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 6), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 6), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 7), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 7), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 8), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 8)]
 */

/* after cards.shuffle()
class Concentrat TODO cards =  [Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 2), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 3), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 4), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 1), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 7), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 6), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 3), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 6), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 8), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 5), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 4), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 8), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 2), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 1), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 7), Concentrat.Card(isFaceUp: false, isMatched: false, identifier: 5)]
 
 */

/*

 class Concentrat
 {
     var cards = [Card]()            // <- equiv to   var cards = Array<Card>()
     
     // allow user to flip/choose card
     func chooseCard (at index: Int) { // index into cards array, let user choose card by specifying index number into cards array
     }
     
     init (numberOfPairsOfCards: Int) {
         for id in 1...numberOfPairsOfCards {
             // 3rd way to create 2 cards (best way)
             // we actually have 3 copy of card
             // (3 distinct card objects in memory)
             let card = Card(identifier: id) // copy #1 of card
             cards += [card, card]     // copy #2 and #3 of card
             
             // 1st way to create card and matchindCard
             // let card = Card(identifier: id)
             // let matchingCard = Card(identifier: id)
             // cards.append(card)
             // cards.append(matchingCard)
             
             // 2nd way to create 2 cards
             // since matchingCard is identical to card (is a copy of card) we can do this:
             // let card = Card(identifier: id)
             // cards.append(card)
             // cards.append(card)
         }
     }
 }
 
 */


// what are essentials to Concentrat class ?
// var cards: Array<Card>       // this has no initializer
// var cards: Array<Card> = []  // this has initializer
// var cards = Array<Card>()    // "=" means we are creating an array of Card
                                // "Array<Card>" is a type
// var cards = [Card]()         // <- equiv to   var cards = Array<Card>()
