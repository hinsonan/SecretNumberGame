//
//  ViewController.swift
//  SecretNumberGame
//
//  Created by Andrew Hinson on 9/18/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberText: UITextField!
    
    
    @IBOutlet weak var numOfGuesses: UILabel!
    
    
    @IBOutlet weak var gameText: UILabel!
    
    var randomNum: Int = 0
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func PlayAgain(_ sender: Any) {
        //set everything back to defaults
        playAgainButton.isHidden = true
        gameText.isHidden = true
        numOfGuesses.text = "10"
        
        //get a new random number
        randomNum = Int(arc4random_uniform(101))
        
        
    }
    @IBAction func Guess(_ sender: Any) {
    //get the number and check if it's a number
        let text = numberText.text
        gameText.isHidden = true
        
        //if its a number then do the check
        if let num = Int(text!){
            //checks if the number is between 0-100
            if num > 100 || num < 0{
                gameText.text = "Please enter a number 0-100"
                gameText.isHidden = false
            }
            
            //see if the number is the correct number
            else if num == randomNum{
                gameText.text = "Congrats You Won"
                gameText.isHidden = false
                playAgainButton.isHidden = false
                
            }
            else if num < randomNum{
                gameText.text = "Too Low Guess Higher"
                gameText.isHidden = false
                //decrease guess counter
                DecreaseGuess()
            }
            else if num > randomNum{
                gameText.text = "Too High Guess Lower"
                gameText.isHidden = false
                //decrease guess counter
                DecreaseGuess()
            }
            
            //check if the player has lost
            if(numOfGuesses.text == "0"){
                gameText.text = "You Lose Correct Number: " + randomNum.description
                gameText.isHidden = false
                playAgainButton.isHidden = false
            }
            
            
            
            
        }
        else{
            gameText.text = "You did not enter a number"
            gameText.isHidden = false
        }
        
    }
    func DecreaseGuess(){
        var guessNum = Int(numOfGuesses.text!)
        guessNum = guessNum! - 1
        numOfGuesses.text =  guessNum?.description //String(describing: guessNum)
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomNum = Int(arc4random_uniform(101))
        playAgainButton.isHidden = true
        gameText.isHidden = true
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

