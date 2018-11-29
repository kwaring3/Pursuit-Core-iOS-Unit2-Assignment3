//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var hangManClass = Hangman()
    var gameWon = false
    
    
    @IBOutlet weak var userInput1: UITextField!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var hangManImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userInput2: UITextField!
    @IBOutlet weak var newGame: UIButton!
    @IBOutlet weak var discardLetter: UILabel!
    

   
    override func viewDidLoad() {
    super.viewDidLoad()
        userInput1.delegate = self
        userInput2.delegate = self
        userInput2.isEnabled = false
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == userInput1) {
            hangManClass.arrays(a: userInput1.text?.lowercased() ?? "Not A String")
            userInput1.isEnabled = false
            userInput2.isEnabled = hangManClass.userInput2
            titleLabel.text = hangManClass.titleLabel
            userInput1.resignFirstResponder()
            return true
        } else if (textField == userInput2) {
            hangManClass.guessWord(b: userInput2.text?.lowercased() ?? "Not A String")
            titleLabel.text = hangManClass.titleLabel
            discardLetter.text = hangManClass.discardLetter
            userInput2.text = ""
            userInput2.resignFirstResponder()
            gameWon = hangManClass.gameDone
            hangManImage.image = hangManClass.hangManImage
            if gameWon {
                userInput2.isEnabled = false
            }
            return true
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (string.rangeOfCharacter(from: CharacterSet.letters) != nil) || (string == "" && range.length > 0){
            titleLabel.text = hangManClass.titleLabel
            return userInput2.text!.count < 1
        } else {
            titleLabel.text = "Please Letters only!"
            return false
        }
    }
    
    
    @IBAction func newGame (_ sender: UIButton) {
        hangManClass.reset()
        hangManImage.image = hangManClass.hangManImage
        userInput1.isEnabled = true
        userInput1.text = ""
        discardLetter.text = hangManClass.discardLetter
        titleLabel.text = hangManClass.titleLabel
        userInput2.isEnabled = false
        userInput2.text = ""
    }
}
  

    

    
   
