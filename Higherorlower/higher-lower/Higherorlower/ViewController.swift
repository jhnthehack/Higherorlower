//
//  ViewController.swift
//  Higherorlower
//
//  Created by Sonjhalyns Augustin on 10/18/23.
//

import UIKit

class ViewController: UIViewController {
    var guesses = 0
    var randomNumber: UInt32 = 0
    
    @IBOutlet weak var guesscount: UILabel!
    @IBOutlet weak var numberTextfield: UITextField!
    @IBOutlet weak var guessTextfield: UITextField!
    @IBOutlet weak var randomnum: UILabel!
    @IBOutlet weak var backgroundView: UIView! // Add an IBOutlet for your background view
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressrandom(_ sender: Any) {
        randomNumber = arc4random_uniform(100)
        self.randomnum.text = "Number: \(randomNumber)"
    }
    
    @IBAction func check(_ sender: Any) {
        guesses += 1
        if let guess = UInt32(guessTextfield.text ?? ""), guess <= 100 {
            let difference = abs(Int(randomNumber) - Int(guess))
            self.guesscount.text = "Guess: \(guesses), Difference: \(difference)"
            // Calculate the color based on the difference
            let color = UIColor(
                red: CGFloat(difference) / 50.0,
                green: 1.0 - CGFloat(difference) / 50.0,
                blue: 0.0,
                alpha: 1.0
            )
            view.backgroundColor = color
        } else {
            self.guesscount.text = "Invalid guess. Please enter a number between 0 and 100."
            guesses -= 1
        }
    }
    
    @IBAction func resetGame(_ sender: UIButton){
        guesses = 0
        self.guesscount.text = "guess: 0"
        self.guessTextfield.text = "0"
        view.backgroundColor =
        UIColor.white// resset background color
            
            
        }
    
        
    
    
    
    

}
