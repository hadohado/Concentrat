//
//  ViewController.swift
//  Concentrat
//
//  Created by ha tuong do on 11/19/19.
//  Copyright © 2019 alpine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet var cardButtons: [UIButton]!
    
    // "game" represents green arrow going from Controller to Model
    // var game: Concentrat <- has no initializer
    // var game: Concentrat = Concentrat()
    
    // Cannot use instance member 'cardButtons' within property initializer; property initializers run before 'self' is available
    lazy var game = Concentrat(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    // dont need " : Concentrat " because of type inference in swift
    // but we need to initialize game object with how many cards in it
    
    // my dummy code to show how to define variable type then
    // initialized it to value of 2
    // var dummyInt: Int = 2
        
    var flipCount: Int = 0 {
        
        didSet { // this is Property Observer
                 // will run this code everytime the flipCount var changes value
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    
    
    
    @IBOutlet weak var flipCountLabel: UILabel! // 1:06:18
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        print("you touched me!")
        flipCount += 1
        
        // cardNumber is never mutated (is a constant) change var to let
        // using firstIndex(of:) to find the position of a particular element in a collection, you can use it to access the element by subscripting.
        if let cardNumber = cardButtons.firstIndex(of: sender) { // _.index(of: <#T##UIButton#>) is obsolete
            // flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel() // new method nov-27
            // print("cardNumber =  \(cardNumber)" )
            
        } else {
            print("chosen card is not in cardButtons array")
        }
        // flipCard(withEmoji: "❤️" , on: sender)
    }
    
    func updateViewFromModel() {
        // for button in cardButtons {   }
        // for  index in 0..<cardButtons.count {   }
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 0.533179118, blue: 0.3817307833, alpha: 0) : #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
                // button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            }
        }
    }

    var emojiChoices : Array<String> = [ "❤️", "🍒" , "🍄", "🐬", "🐥", "🧵", "💰", "🐠", "👩‍❤️‍💋‍👨", "🎯", "😘", "🦀", "❗️", "🎉", "🎄", "🦄" ]
    // var emojiChoices : Array<String> = [ "❤️", "🍒" ,"❤️", "🍒" ]
    
    // var emoji: Dictionary<Int, String> // Dictionary<key type, value type>
    // var emoji = Dictionary<Int, String>() // create empty dictionary
    var emoji = [Int : String]()
    
    func emoji (for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count   > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count) ))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
        
        // if emoji[card.identifier] == nil {
        //    if emojiChoices.count   > 0 {
        //        // arc4random_uniform(un-signed int)
        //        let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count) ))
        //        // let abc = arc4random_uniform(<#T##__upper_bound: UInt32##UInt32#>)
        //        emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        //    }
        // }
        // if let chosenEmoji = emoji[card.identifier]
        //      return emoji[card.identifier] ?? "?"
        // if emoji[card.identifier] != nil {
        //    return emoji[card.identifier]!
        // } else { return "?" }
    }
    
//    @IBAction func touchCard2(_ sender: UIButton) {
//        flipCount += 1
//        flipCard(withEmoji: "🍒" , on: sender)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func flipCard (withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            button.setTitle("", for: UIControl.State.normal)
        } else {
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.setTitle(emoji, for: UIControl.State.normal)
        }
    }

}

