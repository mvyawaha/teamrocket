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
    
//    @IBAction func updateDate(sender: UIDatePicker) {
//        if sender = departDate {
//            departDate.addTarget(self, action: <#T##Selector#>, forControlEvents: <#T##UIControlEvents#>)
//        }
//    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        closeKeyboard()
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func getMaxDate(days: Int) -> NSDate {
        let dateComponents = NSDateComponents()
        let currentCal = NSCalendar.currentCalendar()
        let calendarOption = NSCalendarOptions()
        dateComponents.day = days
        let maxDate = currentCal.dateByAddingComponents(dateComponents, toDate: NSDate(), options: calendarOption)
        return maxDate!
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        if textField == departDate {
            let datePicker = UIDatePicker()
            let currentDate = NSDate()
            datePicker.minimumDate = currentDate
            print("current date: ")
            print(currentDate)
            print("date 14 days from now")
            let maxDate = getMaxDate(14)
            print(maxDate)
            datePicker.maximumDate = maxDate
            datePicker.datePickerMode = UIDatePickerMode.Date
            textField.inputView = datePicker
            datePicker.addTarget(self, action: "datePickerChanged:", forControlEvents: .ValueChanged)
        }
    }
    
    func datePickerChanged(sender: UIDatePicker){
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        departDate.text = formatter.stringFromDate(sender.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        flightNumber.delegate = self
        departDate.delegate = self
    }



}

