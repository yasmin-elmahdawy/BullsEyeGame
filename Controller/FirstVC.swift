//
//  FirstVC.swift
//  MyBullsEyeApp
//
//  Created by G50 on 3/10/20.
//  Copyright © 2020 G50. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    
//MARK:- IBOutlets
    
    @IBOutlet weak var targetLBL: UILabel!
    @IBOutlet weak var scoreLBL: UILabel!
    @IBOutlet weak var roundLBL: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    
    
//MARK:- Constants
    //target var stores the value of the randomly generated num
    var score = 0
    var round = 0
    var target = 0
    var currentVal = 0
    var difference = 0
    var midVal = 50
    var status = ""
    
   override func viewDidLoad() {
        super.viewDidLoad()
       
       setUpUISlider()
        reset()
    }
    
 //MARK:- IBActions
    
    @IBAction func uiSliderBarPressed(_ sender: UISlider) {
        
        currentVal = Int(sender.value.rounded())
        print(currentVal)
    }
    
    @IBAction func hitMeBtnPressed(_ sender: UIButton) {
       
        newRound()
        showPopAlert()

    }
    
    
    @IBAction func infoBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "mySegue", sender: nil)
    }
    
    @IBAction func resetBtnPressed(_ sender: UIButton) {
        reset()
    }
    
 //MARK:- Helper Functions
    
    func setUpUISlider(){
    //set up the thumb Image which appears in the middle of slider
      
      let thumbImage = #imageLiteral(resourceName: "SliderThumb-Normal")
      sliderOutlet.setThumbImage(thumbImage, for: .normal)
        
      let thumbImageClicked = #imageLiteral(resourceName: "SliderThumb-Highlighted")
      sliderOutlet.setThumbImage(thumbImageClicked, for: .highlighted)
        
      let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
      let leftTrackImg = #imageLiteral(resourceName: "SliderTrackLeft")
      let resizableLeftImg = leftTrackImg.resizableImage(withCapInsets: insets)
      sliderOutlet.setMinimumTrackImage(resizableLeftImg, for: .normal)

        
      let rightTrackImg = #imageLiteral(resourceName: "SliderTrackRight")
      let resizableRightImg = rightTrackImg.resizableImage(withCapInsets: insets)
      sliderOutlet.setMaximumTrackImage(resizableRightImg, for: .normal)
        
    }
    
    func generateRandomNumber(){
        
        target = Int.random(in: 2...99)
        
        targetLBL.text = "\(target)"
    }
   
    func calcRound(){
        round += 1
        roundLBL.text = "\(round)"
    }
    
    func calculateScore(){
    //the score is calculated based on the difference
     
        difference = target > currentVal ? target - currentVal : currentVal - target
    
        if difference == 0 {
            score += 200
            status = "Congratulations , that's perfect"
        }else if difference < 3{
            score += 100
            status = "Very Good"
        }else if difference < 5 {
            score += 50
            status = "Good"
        }else if difference < 10{
            score += 25
            status = "Not Bad"
        }else{
            score += 0
            status = "Hard Luck !"
        }
        scoreLBL.text = "\(score)"
    }
    
    func newRound(){
        
        calcRound()
        sliderOutlet.value = Float(midVal)
   
        calculateScore()
    }
    
   func reset(){
        
     generateRandomNumber()
     round = 1
     score = 0
     difference = 0
             
     sliderOutlet.value = Float(midVal)
             
     scoreLBL.text = "\(score)"
     roundLBL.text = "\(round)"
        
  }
    func showPopAlert(){
      
      let alert =  UIAlertController(title: status, message:
        "Your target is : \(target) \n Your difference is : \(difference) \n Your score is : \(score) "
         , preferredStyle: .alert)
        
      let action = UIAlertAction(title: "Cnncel", style: .cancel) { (action) in
            self.generateRandomNumber()
        }
        
      alert.addAction(action)
        
       present(alert, animated: true, completion: nil)
    }

}

