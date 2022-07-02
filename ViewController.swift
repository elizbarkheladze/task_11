//
//  ViewController.swift
//  task_11_elizbar
//
//  Created by alta on 6/30/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var firstnumLabel: UILabel!
    @IBOutlet weak var secondnumLabel: UILabel!
    @IBOutlet weak var thirdnumLabel: UILabel!

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func randomNumsSlider(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        firstnumLabel.text = String(Int.random(in: 0...currentValue))
        secondnumLabel.text = String(Int.random(in: 0...currentValue))
        thirdnumLabel.text = String(Int.random(in: 0...currentValue))

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nums = [Int(firstnumLabel.text!),Int(secondnumLabel.text!),Int(thirdnumLabel.text!)]
        
        if textField == textField{
            if textField.text == "max" {
                answerLabel.text = "max is : \(nums.reduce(Int.min, { max($0, $1!) })) "
            }else if textField.text == "min" {
                answerLabel.text = "max is : \(nums.reduce(Int.max, { min($0, $1!) }))"
            }else if textField.text == "average" {
                answerLabel.text = "average is : \((Double(nums.reduce(0){$0 + $1!}))/Double(nums.count))"
            } else {
                answerLabel.text = "input was incorrect, please enter 'min','max' or 'average'"
            }
        }
        return true
    }


}

