//
//  ViewController.swift
//  FlightStatus
//
//  Created by Mrunmayi on 4/23/16.
//  Copyright © 2016 TeamRocket. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var flightNumber: UITextField!
    @IBOutlet weak var departDate: UITextField!
    
    func closeKeyboard() {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        closeKeyboard()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        flightNumber.delegate = self
        departDate.delegate = self
    }


}

