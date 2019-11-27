//
//  ViewController.swift
//  Concentrat
//
//  Created by ha tuong do on 11/19/19.
//  Copyright © 2019 alpine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // "game" represents green arrow going from Controller to Model
    // var game: Concentrat <- has no initializer
    // var game: Concentrat = Concentrat()
    var game = Concentrat(numberOfPairsOfCards: 8)
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
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices : Array<String> = [ "❤️", "🍒" ,"❤️", "🍒" , "🍄", "🐬", "🐥", "🧵", "💰", "🐠", "👩‍❤️‍💋‍👨", "🎯", "😘", "🦀", "❗️", "🎉", "🎄", "🦄" ]
    @IBOutlet weak var flipCountLabel: UILabel! // 1:06:18
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        print("you touched me!")
        flipCount += 1
        
        // cardNumber is never mutated (is a constant) change var to let
        // using firstIndex(of:) to find the position of a particular element in a collection, you can use it to access the element by subscripting.
        if let cardNumber = cardButtons.firstIndex(of: sender) { // _.index(of: <#T##UIButton#>) is obsolete
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            // print("cardNumber =  \(cardNumber)" )
        } else {
            print("chosen card is not in cardButtons array")
        }
        // flipCard(withEmoji: "❤️" , on: sender)
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

