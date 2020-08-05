//
//  GameMediumViewController.swift
//  Tapping Game 1
//
//  Created by Eshaan Gandhi on 8/4/20.
//  Copyright © 2020 Emily. All rights reserved.
//

import UIKit

class GameMediumViewController: UIViewController {

    @IBOutlet weak var mediumScoreLabel: UILabel!
    @IBOutlet weak var mediumTimeLabel: UILabel!
    var seconds = 20
    var tapInt = 1
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
            startTimer()
    }
    
    func startTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.mediumTimeLabel.text = String(self.seconds)
            self.seconds -= 1
            if self.seconds == -1 {
                timer.invalidate()
                
            }
        }
    
    }
    @IBAction func tapScore(_ sender: Any) {
        self.mediumScoreLabel.text = String(self.tapInt)
        self.tapInt += 1
    }
    
    
    
    

        
}
