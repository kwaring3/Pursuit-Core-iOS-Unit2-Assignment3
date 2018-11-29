//
//  hangManBrainViewController.swift
//  Hangman
//
//  Created by Kevin Waring on 11/27/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class Hangman {
    var titleLabel: String = ""
    var discardLetter: String = ""
    var answerArray = [String]()
    var guessArray = [String]()
    var dLArray = [String]()
    var userInput2: Bool = false
    var hangManImage: UIImage = UIImage(named: "hang1")!
    var wrongGuess: Int = 0
    var gameDone: Bool = false
    
    func reset() {
        answerArray.removeAll()
        guessArray.removeAll()
        dLArray.removeAll()
        titleLabel = "Hangman!"
        discardLetter = "Discarded Letter"
        hangManImage = UIImage(named: "hang1")!
        wrongGuess = 0
    }
    
    
    func arrays(a: String) {
        gameDone = false
        for i in a {
            answerArray.append(String(i))
            guessArray.append("_")
        }
        titleLabel = guessArray.compactMap{$0}.joined(separator: " ")
        userInput2 = true
    }
    
    
    func guessWord (b: String) {
        if answerArray.contains(b) {
            if guessArray.contains(b) {
                titleLabel = "You chose \(b) already."
            } else {
                
                for i in 0..<answerArray.count {
                    for _ in answerArray {
                        if answerArray[i] == b {
                            guessArray[i] = answerArray[i]
                            if guessArray == answerArray {
                                titleLabel = "You won The word is \(guessArray.compactMap{$0}.joined())!"
                                gameDone = true
                                break
                            }
                            titleLabel = guessArray.compactMap{$0}.joined(separator: " ")
                        }
                    }
                }
            }
            
            
        } else {
            if dLArray.contains(b) {
                titleLabel = "You chose \(b) already."
            } else {
                
                wrongGuess += 1
                dLArray.append(b)
                titleLabel = "\(b) is not a part of this word."
                discardLetter = "\(dLArray.compactMap{$0}.joined(separator: ", "))"
            }
        }
        
        
        if wrongGuess > 1 && wrongGuess < 7 {
            hangManImage = UIImage(named: "hang\(wrongGuess)")!
        } else if wrongGuess == 7 {
            hangManImage = UIImage(named: "hang\(wrongGuess)")!
            titleLabel = "Aw. GAME OVER! The word was \(answerArray.compactMap{$0}.joined())"
            gameDone = true
        }
        
    }
    
}
