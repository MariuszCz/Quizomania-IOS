//
//  ViewController.swift
//  Quizomania
//
//  Created by Jakub Janicki on 18.05.2016.
//  Copyright © 2016 Mariusz Czeszejko-Sochacki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
                    print(json)
                    if let  arrayOfDicts = json as? [Dictionary<String, AnyObject>] {
                        
                        for question in arrayOfDicts {
                            print(question["question"])
                        }
                        
//                        if let question = dict["question"] as? String, let answer = dict["answer"] as? String, let categoryId = dict["category_id"] as? String {
//                            let questionBody = QuestionModel(question: question, answer: answer, categoryId: categoryId)
//                            
//                            print(questionBody.question)
//                            print(questionBody.answer)
//                            print(questionBody.categoryId)
//                 
//                        }
                        
                    }
                    
                    // print(json)
                } catch let err as NSError {
                    print(err.debugDescription)
                }
            }
            }.resume()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

