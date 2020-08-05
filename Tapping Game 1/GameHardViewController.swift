//
//  GameHardViewController.swift
//  Tapping Game 1
//
//  Created by Eshaan Gandhi on 8/4/20.
//  Copyright © 2020 Emily. All rights reserved.
//

import UIKit

class GameHardViewController: UIViewController {
    
    @IBOutlet weak var hardScoreLabel: UILabel!
    @IBOutlet weak var hardTimeLabel: UILabel!
    var seconds = 10
    var tapInt = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    func startTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.hardTimeLabel.text = String(self.seconds)
            self.seconds -= 1
            if self.seconds == -1 {
                timer.invalidate()
                self.displayAlert(message: "Game Over")
            }
            
        }
    
   }
    func resetGame(){
       hardScoreLabel.text = ""
   }
   func displayAlert(message: String){
       let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
       let alertAction = UIAlertAction(title: "Game Over!", style: .default){
           (action) in self.resetGame()
    }
    alert.addAction(alertAction)
    present(alert, animated: true, completion: nil)
    
       
   }
    @IBAction func tapScore(_ sender: Any) {
        self.hardScoreLabel.text = String(self.tapInt)
        self.tapInt += 1
    }
    
    
    
    
    
    
}



