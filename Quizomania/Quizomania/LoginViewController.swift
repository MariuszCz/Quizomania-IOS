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
                override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
         


    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        if (segue.identifier == "segueQuestions") {
//            let svc = segue.destinationViewController as! SelectCategoryViewController
//     //       svc.arrayOfDicts = self.arrayOfDicts
//      
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

