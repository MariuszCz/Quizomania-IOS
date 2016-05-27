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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryPicker.dataSource = self
        self.categoryPicker.delegate = self
        print(arrayOfDicts)
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayOfDicts.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let ar = arrayOfDicts[row]["category"] as? Dictionary<String,AnyObject> {
            return "\(ar["title"])"
    }
        return nil
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selected = "\(arrayOfDicts[row]["category"]!["id"])"
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueQuiz") {
            let quiz = segue.destinationViewController as! QuizViewController
            quiz.arrayOfDicts = self.arrayOfDicts
            quiz.selected = self.selected

        }
    }
}