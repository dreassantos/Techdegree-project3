//
//  ResultViewController.swift
//  BoutTime
//
//  Created by Andrea on 2/16/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var playAgainButton: UIButton!
    var userScoreFromFirstView: String = ""
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = userScoreFromFirstView
    }
    
    @IBAction func closeView(_ sender: UIButton){
    dismiss(animated: true, completion: nil)
    }
}
