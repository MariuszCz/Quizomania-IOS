//
//  QuizViewController.swift
//  Quizomania
//
//  Created by Kamil Bękarciak on 27.05.2016.
//  Copyright © 2016 Mariusz Czeszejko-Sochacki. All rights reserved.
//

import UIKit
class QuizViewController: UIViewController {
        var arrayOfDicts: [Dictionary<String, AnyObject>] = []
        var question: String!
        var answer: String!
        override func viewDidLoad() {
        super.viewDidLoad()

        if(question != nil) {
            questionTextView.text = question
            answerA.setTitle(answer, forState: .Normal)
        }
    }
    
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answerA: UIButton!
}