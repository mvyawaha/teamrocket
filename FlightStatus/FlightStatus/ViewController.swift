//
//  ViewController.swift
//  spaceApp
//
//  Created by Kay Lab on 4/23/16.
//  Copyright © 2016 Kay Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cityNameTextField: UITextField!
   
    @IBOutlet weak var cityNameLabel: UILabel!

   
    @IBOutlet weak var cityTempLabel: UILabel!
   

    @IBAction func getDataButtonClicked(sender: AnyObject) {
    }
   
    @IBOutlet weak var dateTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherData("http://api.openweathermap.org/data/2.5/weather?q=London.uk&APPID=52cf6129bafdcc52147e7665f7941564")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getWeatherData(urlString: String)
    {
        let url=NSURL(string: urlString)
        _=NSURLSession.sharedSession().dataTaskWithURL(url!){
            (data, response, error) in dispatch_async(dispatch_get_main_queue(),{self.setLabels(data!)
        })
    }
    }
    func setLabels(weatherData: NSData)
    {
       
        do
        {
        let json = try NSJSONSerialization.JSONObjectWithData(weatherData, options: []) as! NSDictionary
            if let name=json["name"] as? String {
                cityNameLabel.text=name;
            }
            if let main=json["main"] as? NSDictionary{
                if let temp=main["temp"] as? Double{
                    cityTempLabel.text=String(format: "%.1f",temp)
                }
            }

        }catch{
            print(error)
        }
            }


}

