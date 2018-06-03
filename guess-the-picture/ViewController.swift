//
//  ViewController.swift
//  guess-the-picture
//
//  Created by Liu Teng Hou on 5/27/18.
//  Copyright © 2018 wewantcookies. All rights reserved.
//

import UIKit
import GameplayKit
import os.log

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score:Int = 0
    //this should be an enum 0-2, for which flag holds the correct answer
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1;
        button2.layer.borderWidth = 1;
        button3.layer.borderWidth = 1;
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        
        //shuffles array
        //TODO: change to 3 random numbers instead of reshuffling the whole array
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
        button1.setImage(UIImage(named:countries[0]), for: .normal)
        button2.setImage(UIImage(named:countries[1]), for: .normal)
        button3.setImage(UIImage(named:countries[2]), for: .normal)
        
        //set title to correctAnswer
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()
    }

    //checked whether answer is correct
    //adjust score +/-
    //tell user what their score is
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title:String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        }else{
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated:true)
        
    }
    
}

