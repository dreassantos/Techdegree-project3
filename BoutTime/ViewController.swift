//
//  ViewController.swift
//  BoutTime
//
//  Created by Andrea on 2/7/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UIScrollViewDelegate {
    //Pop up button - to "Zoom" into icon images
    @IBOutlet var imagePopUpView: UIView!
    @IBOutlet weak var popUpImage: UIImageView!
    @IBOutlet weak var imagePopUpCloseButton: UIButton!
    
    //main ViewController Outlets
    //Image buttons
    @IBOutlet var imageButtons: [UIButton]!
    //Option "Buttons" - used buttons so that they respond to actions.
    @IBOutlet var optionButtons: [UIButton]!
    //Question Navigation Buttons
    @IBOutlet var navButtons: [UIButton]!
    //Timer label
    @IBOutlet weak var timerLabel: UILabel!
    //next round Buttons
    @IBOutlet var nextRoundButton: [UIButton]!
    
    //ViewController Variables
    var gameManager = GameManager()
    var currentOptionsCopy:[String] = []
    var order:[Int] = []
    var userCarOrderByName:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePopUpView.layer.cornerRadius = 10
        newRound()
    }

    //Check for motion - if shake reset the timer.
    //resource https://developer.apple.com/documentation/uikit/uiresponder/1621120-motionbegan
    override func motionBegan(_ motion: UIEvent.EventSubtype,with event: UIEvent?) {
        resetTimer()
    }

    
    // Game set up
    func newRound() {
        gameManager.newRound()
        //Hide some of the buttons
        changeButtonProperty(buttonsArray: optionButtons, status: false, actionToDo: "disable")
        changeButtonProperty(buttonsArray: navButtons, status: true, actionToDo: "enable")
        changeButtonProperty(buttonsArray: nextRoundButton, status: true, actionToDo: "hide")
        //Start/Restart the timer
        if timerIsRunning == false {
            startTimer()
        }
        // get the options for the new round
        let options = gameManager.getOptionText()
        //made temp copy to manipulate
        currentOptionsCopy = options
        //This will be the default order for the button label, set up the labels
        order = [0,1,2,3]
        setOptions(order: order)
    }
  
    func setOptions (order:[Int]) {
        for index in 0...(optionButtons.count - 1){
            for optionButton in optionButtons {
                //assign the title to the matching button
                if optionButton == optionButtons[index] {
                    optionButton.setTitle(currentOptionsCopy[order[index]], for: .normal)
                    }
                }
            }
        //save the users order into a variable for later use.
        if  let option1 = optionButtons[0].currentTitle,
            let option2 = optionButtons[1].currentTitle,
            let option3 = optionButtons[2].currentTitle,
            let option4 = optionButtons[3].currentTitle {
            userCarOrderByName = [option1,option2,option3, option4]
            }
        setOptionIcon()
    }
    
    func setOptionIcon() {
        let images = gameManager.getImageNames()
        for index in 0...(imageButtons.count - 1){
            for button in imageButtons {
                if button == imageButtons[index] {
                    button.setImage(images[order[index]], for: .normal)
                }
            }
        }
    }
    
    // game results
    func endRound(){
        changeButtonProperty(buttonsArray: optionButtons, status: true, actionToDo: "enable")
        changeButtonProperty(buttonsArray: navButtons, status: false, actionToDo: "enable")
        checkResults()
    }
    //This is ran before the segue is actioned
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let result = gameManager.getResult()
        let destionationVC: ResultViewController = segue.destination as! ResultViewController
        destionationVC.userScoreFromFirstView = result
    }

    func checkResults() {
        print("this is the users order before it gets passed to check results \(userCarOrderByName)") // this order is correct so far
        (gameManager.checkAnswer(usersOrder: userCarOrderByName)) ? (nextRoundButton[1].isHidden = false) : (nextRoundButton[0].isHidden = false)
    }
    
    //this is the web browser if the user clicks on an option.
    func showOptionRerence(url: String) {
        if let url = URL(string: url) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
        
            let viewController = SFSafariViewController(url: url, configuration: config)
            viewController.preferredBarTintColor = UIColor.orange
            viewController.preferredControlTintColor = UIColor.white
            present(viewController, animated: true, completion: nil)
        }
    }
    
    // Enable/ Disable buttons
    func changeButtonProperty(buttonsArray: [UIButton], status: Bool, actionToDo: String) {
        switch actionToDo {
        case "enable", "disable":
                                for button in buttonsArray {
                                button.isEnabled = status
                                }
         case "hide", "show" :
                                for button in buttonsArray {
                                    button.isHidden = status
                                }
        default: print("could not preform actions on your buttons")
        }
    }
    
    //timer functions
    var timeLeft = 10
    var timer = Timer()
    var timerIsRunning = false
    
    func startTimer(){
        timerLabel.isHidden = false
        timerIsRunning = true
        timerLabel.text = nil
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        //stop the timer from becomming negative
        if timeLeft < 1 { // cant put == 0 because if it glitches to -1 it will keep going.
            //timer.invalidate()
            resetTimer()
        } else {
            timeLeft -= 1
            timeLeft < 10 ? (timerLabel.text = "0:0\(timeLeft)") : (timerLabel.text = "0:\(timeLeft)")
        }
    }
    
    func resetTimer(){
        timer.invalidate()
        timeLeft = 10
        endRound()
        timerLabel.isHidden = true
        timerIsRunning = false
    }
    
    
    //Button Actions
    //popUp Button Actions
    @IBAction func imagePopOver(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            popUpImage.image = imageButtons[0].currentImage
        case 1:
            popUpImage.image = imageButtons[1].currentImage
        case 2:
            popUpImage.image = imageButtons[2].currentImage
        case 3:
            popUpImage.image = imageButtons[3].currentImage
        default:
            popUpImage.image = UIImage(named: "defaultImageLarge.png")
        }
        self.view.addSubview(imagePopUpView)
        imagePopUpView.center = self.view.center
    }
    
    @IBAction func imageCloseButton(_ sender: UIButton) {
        self.imagePopUpView.removeFromSuperview()
    }
    //ViewController Button Actions
    @IBAction func navButton(_ sender: UIButton) {
        //Switch to handle text population
        switch sender.tag {
        case 4,7:
                order.insert(order[1], at: 0)
                order.remove(at: 2)
        case 5,8:
                order.insert(order[2], at: 1)
                order.remove(at: 3)
        case 6,9:
                order.insert(order[3], at: 2)
                order.remove(at: 4)
        default:order = [0,1,2,3]
        }
        setOptions(order: order)
    }
    
    @IBAction func nextRound(_ sender: UIButton) {
        let gameOver = gameManager.checkGameOver()
        gameOver ? (performSegue(withIdentifier: "resultViewSegue", sender: self)) : newRound()
    }

    @IBAction func showMoreInfoScreen(_ sender: UIButton) {
        let userUrlOrder = gameManager.setUrl(userOrder: userCarOrderByName)
        print(userUrlOrder)
        switch sender.tag {
        case 4: showOptionRerence(url: userUrlOrder[0])
        case 5: showOptionRerence(url: userUrlOrder[1])
        case 6: showOptionRerence(url: userUrlOrder[2])
        case 7: showOptionRerence(url: userUrlOrder[3])
        default: //if the url is invalid send them to google....
            showOptionRerence(url: "http://google.com")
        }
    }
}


