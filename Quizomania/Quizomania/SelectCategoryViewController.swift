//
//  SelectCategoryViewController.swift
//  Quizomania
//
//  Created by Kamil Bękarciak on 27.05.2016.
//  Copyright © 2016 Mariusz Czeszejko-Sochacki. All rights reserved.
//

import UIKit
class SelectCategoryViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    var arrayOfCategories: [Dictionary<String, AnyObject>] = []
    var arrayOfQuestions: [Dictionary<String, AnyObject>] = []
    var question: String!
    var answer: String!
    var category: String!
    var urlQuestionsString: String = ""
    typealias DownloadComplete = () -> ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryPicker.dataSource = self
        self.categoryPicker.delegate = self
        let urlString = "http://jservice.io/api/clues"
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!

        
        downloadCategories(url, session: session) { 
            self.categoryPicker.reloadAllComponents()
        
                        }
        //print(arrayOfDicts)
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayOfCategories.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
            if let ar = arrayOfCategories[row]["category"] as? Dictionary<String,AnyObject> {
                return "\(ar["title"]!)"
            }
            return nil
            
        }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
 
        if let ar = arrayOfCategories[row]["category"] as? Dictionary<String,AnyObject> {

            self.urlQuestionsString = "http://jservice.io/api/clues?category=" + "\(ar["id"]!)"
            self.category = "\(ar["title"]!)"
        }
        let urlQuestions = NSURL(string: self.urlQuestionsString)
        let session = NSURLSession.sharedSession()
        self.downloadQuestions(urlQuestions!, session: session) {}

            }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueQuiz") {
            let quiz = segue.destinationViewController as! QuizViewController
            quiz.arrayOfQuestions = self.arrayOfQuestions
            quiz.category = category

        


        }
    }
    
    
    
    func downloadCategories(url: NSURL ,session: NSURLSession ,completed: DownloadComplete) {
        
        session.dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if let responseData = data {
                
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
                    
                    self.arrayOfCategories = json as! [Dictionary<String, AnyObject>]
                    
                    //                    print(self.arrayOfDicts)
                    
                } catch let err as NSError {
                    print(err.debugDescription)
                }
                completed()
            }
            
            }.resume()
        
    }
    
    func downloadQuestions(url: NSURL ,session: NSURLSession ,completed: DownloadComplete) {
        
        session.dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if let responseData = data {
                
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
                    
                    self.arrayOfQuestions = json as! [Dictionary<String, AnyObject>]
                    
                    //                    print(self.arrayOfDicts)
                    
                } catch let err as NSError {
                    print(err.debugDescription)
                }
                completed()
            }
            }.resume()
        
    }

}