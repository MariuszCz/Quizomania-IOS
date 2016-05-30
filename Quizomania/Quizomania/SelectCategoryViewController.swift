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
    var arrayOfDicts: [Dictionary<String, AnyObject>] = []
    var selected: String!
    
    typealias DownloadComplete = () -> ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryPicker.dataSource = self
        self.categoryPicker.delegate = self
        let urlString = "http://jservice.io/api/categories?count=100"
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
        return arrayOfDicts.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        if let categoryDict = arrayOfDicts[row] as? Dictionary<String, AnyObject> {
            
            if let categoryName = categoryDict["title"] as? String {
                return categoryName
            }
            
        }
        
        return String()
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selected = "\(arrayOfDicts[row]["id"]!)"
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueQuiz") {
            let quiz = segue.destinationViewController as! QuizViewController
            quiz.arrayOfDicts = self.arrayOfDicts
            quiz.selected = self.selected

        }
    }
    
    func downloadCategories(url: NSURL ,session: NSURLSession ,completed: DownloadComplete) {
        
        session.dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if let responseData = data {
                
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
                    
                    self.arrayOfDicts = json as! [Dictionary<String, AnyObject>]
                    
                    //                    print(self.arrayOfDicts)
                    
                } catch let err as NSError {
                    print(err.debugDescription)
                }
                completed()
            }
            
            }.resume()
        
    }
}