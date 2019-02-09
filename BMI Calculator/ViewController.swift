//
//  ViewController.swift
//  BMI Calulator
//
//  Created by student14 on 2/2/19.
//  Copyright © 2019 student14. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Variables
    var bmi = 0
    var bmiMessage = ""
    var weightInKg = 0.0
    var heightInMeters = 0.0
    var heightInInches = 0.0
    
    @IBOutlet weak var heightInFeetTextField: UITextField!
    @IBOutlet weak var remainingInchesTextField: UITextField!
    @IBOutlet weak var weightInPoundsTextField: UITextField!
    @IBOutlet weak var bmiResultLabel: UILabel!
    @IBOutlet weak var bmiMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        // convert weight in pounds to kilograms: 1 lb. = 0.453592 Kg.
        weightInKg = Double(weightInPoundsTextField.text!)! * 0.453592
        
        // convert height in feet and inches to meters: 1 in. = 0.0254 m.
        heightInInches = Double(heightInFeetTextField.text!)! * 12.0 + Double(remainingInchesTextField.text!)!
        heightInMeters = heightInInches * 0.0254
        
        // calculate bmi = kg / m * m
        bmi = Int(weightInKg / pow(heightInMeters, 2))
        
        // show user the bmi result
        bmiResultLabel.text = String(bmi)
        //bmiResultLabel.text = String(format: "%.2f", bmi)
        
        // determine message based on the bmi
        switch bmi {
        case 0...18:
            bmiMessage = "Underweight BMI"
        case 19...24:
            bmiMessage = "Healthy BMI"
        case 25...29:
            bmiMessage = "Overweight BMI"
        case 30...39:
            bmiMessage = "Obese BMI"
        default:
            bmiMessage = "Extreme Obese BMI"
        }
        // set bmi message to message label
        bmiMessageLabel.text = bmiMessage
    }
    
}

