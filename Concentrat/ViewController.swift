//
//  ViewController.swift
//  Concentrat
//
//  Created by ha tuong do on 11/19/19.
//  Copyright © 2019 alpine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        print("you touched me!")
        flipCount += 1
        flipCard(withEmoji: "❤️" , on: sender)
    }
    
    
    @IBAction func touchCard2(_ sender: UIButton) {
        flipCount += 1
        flipCard(withEmoji: "🍒" , on: sender)
    }
    
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

