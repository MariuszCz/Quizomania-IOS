//
//  ViewController.swift
//  Quizomania
//
//  Created by Jakub Janicki on 18.05.2016.
//  Copyright © 2016 Mariusz Czeszejko-Sochacki. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
        var arrayOfDicts: [Dictionary<String, AnyObject>] = []
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
            let urlString = "http://jservice.io/api/clues"
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        session.dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if let responseData = data {
                
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)

                    self.arrayOfDicts = json as! [Dictionary<String, AnyObject>]

                } catch let err as NSError {
                    print(err.debugDescription)
                }
            }
            }.resume()


    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueQuestions") {
            let svc = segue.destinationViewController as! SelectCategoryViewController
            svc.arrayOfDicts = self.arrayOfDicts
      
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

