//
//  ViewController.swift
//  RPS
//
//  Created by Константин Лопаткин on 19/09/2019.
//  Copyright © 2019 Konstantin Lopatkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var robotButton: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissersButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playAgainButton.isHidden = true
    }
    
    func play (_ sign: Sign){
        let computerSign = randomSign()
        robotButton.text = computerSign.emoji
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            scissersButton.isHidden = true
            paperButton.isHidden = true
        case .paper:
             rockButton.isHidden = true
             paperButton.isHidden = false
            scissersButton.isHidden = true
        case .scissors:
            scissersButton.isHidden = false
            paperButton.isHidden = true
            rockButton.isHidden = true

        }
        playAgainButton.isHidden = false
        
        let result = sign.getResult(for: computerSign)
        
        switch result {
        case .win:
            statusLabel.text = "You win!"
            self.view.backgroundColor = UIColor.green
        case .draw:
            statusLabel.text = "Draw!"
            self.view.backgroundColor = UIColor.gray
        case .lose:
            statusLabel.text = "You lose!"
            self.view.backgroundColor = UIColor.red
        case .start:
            reset()
            
        }

    }
    func reset() {
        statusLabel.text = "Rock, paper, scissors?"
        view.backgroundColor = UIColor.white
        rockButton.isHidden = false
        scissersButton.isHidden = false
        paperButton.isHidden = false
        playAgainButton.isHidden = true
    }

    @IBAction func rockPressed(_ sender: Any) {
        play(.rock)
    }
    @IBAction func paperPressed(_ sender: Any) {
        play(.paper)
    }
    @IBAction func scissorsPressed(_ sender: Any) {
        play(.scissors)
    }
    @IBAction func resetPressed(_ sender: Any) {
        reset()
    }
    
}

