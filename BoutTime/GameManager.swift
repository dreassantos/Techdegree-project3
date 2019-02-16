//
//  GameManager.swift
//  BoutTime
//
//  Created by Andrea on 2/10/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//

import Foundation
import GameKit

class GameManager {
    let cars = Cars()
    //round options
    let roundsPerGame = 6
    var round = 0
    var roundsCorrect = 0
    //round check
    var indexOfSelectedOption = 0
    var indexOfUsedOption:[Int] = []
    //var questionsWrong:[String] = []
    //vars for selected questions
    var currentOptionNames:[String] = []
    var currentImageName:[UIImage] = []
    var currentCarYears:[Int] = []
    var currentWebNames:[String] = []
 
    
    func newRound() {
    currentOptionNames.removeAll()
    currentImageName.removeAll()
    currentCarYears.removeAll()
    currentWebNames.removeAll()
    }
    
    /// Selects an unused random number  to be set as our quiz index
    func randomOption() {
        //pulls a random index from the 0...carList count
        let tempSelectedIndex = GKRandomSource.sharedRandom().nextInt(upperBound: cars.carList.count)
        //check if that index was already used in this game
        if !(indexOfUsedOption.contains(tempSelectedIndex)){
            //if not used add it to used questions
            indexOfUsedOption.append(tempSelectedIndex)
            indexOfSelectedOption = tempSelectedIndex
            // if it was already used pick and test another number.
        } else { randomOption() }
    }
    
    /// Returns an array with 4 options text
    func setRoundOptions(){
        for _ in 0...3 {
            randomOption()
            //save the current rounds options
            currentOptionNames.append(cars.carList[indexOfSelectedOption].carName)
            currentCarYears.append(cars.carList[indexOfSelectedOption].carYear)
            currentWebNames.append(cars.carList[indexOfSelectedOption].websiteUrl)
            if let image = UIImage(named: cars.carList[indexOfSelectedOption].imageName) {
                currentImageName.append(image)
            } else {
                
                currentImageName.append(#imageLiteral(resourceName: "defaultImage")) // this may crash b/c of xcode https://teamtreehouse.com/community/when-i-enter-default-it-disappears-then-crashes
            }
        }
    }
    
    func getOptionText() -> [String] {
        setRoundOptions()
        return currentOptionNames
    }

    func getImageNames() -> [UIImage] {
        return currentImageName
    }
    
    func setUrl (userOrder: [String]) -> [String] {
        let userOrder = userOrder
        var usersUrlOrder:[String] = []
        
         for counter in 0...(userOrder.count-1) {
            for car in cars.carList {
            //sending back all the options urls back in the users order.
                if userOrder[counter].contains(car.carName) {
                    print(userOrder[counter])
                    print(car.carName)
                    print(car.carYear)
                    print(car.websiteUrl)
                    usersUrlOrder.append(car.websiteUrl)
                }
            }
        }
        return usersUrlOrder
    }
    
    func checkAnswer(usersOrder: [String]) -> Bool {
        let usersOrder = usersOrder //order of the car names passed through
        print(usersOrder) //correct so far
        // sorts the options car years oldes-newst.
        var usersCarYearOrder:[Int] = [] //save the cars year that matches the cars name
      
        for counter in 0...(usersOrder.count-1) {
            for car in cars.carList {
            if usersOrder[counter].contains(car.carName) {
                print(usersOrder[counter])
                print(car.carName)
                usersCarYearOrder.append(car.carYear)
                print(car.carYear)
                print(usersCarYearOrder)
                }
            }
        }
        
        let correctOrder:[Int] = currentCarYears.sorted()
        print(usersCarYearOrder)
        print(cars.carList.count)
        if (usersCarYearOrder.elementsEqual(correctOrder)) {
            roundsCorrect += 1
            print("This is the correct order!!!!")
            print("the order you chose - \(usersCarYearOrder)")
            print("the correct order - \(correctOrder)")
            return true
        } else {
            print("This order is incorrect")
            print("the order you chose - \(usersCarYearOrder)")
            print("the correct order - \(correctOrder)")
            return false
        }
    }
    
    func checkGameOver() -> Bool {
        round += 1
        var status = false
        (round == roundsPerGame) ? (status = true) : (status = false)
        return status
    }
    
    func getResult() -> String {
        return ("\(roundsCorrect) / \(roundsPerGame)")
    }
}
