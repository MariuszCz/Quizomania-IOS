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
        var arrayOfQuestions: [Dictionary<String, AnyObject>] = []
        var category: String!
        var question: String!
        var answer: String!
        override func viewDidLoad() {
        super.viewDidLoad()

            getRandomQuestion()
        if(question != nil) {
            questionTextView.text = question
            answerA.setTitle(answer, forState: .Normal)
            categoryLabel.text = category
        }
            
    }
    func getRandomQuestion() {
        let randomQuestion = Int(arc4random_uniform(UInt32(self.arrayOfQuestions.count)))
        self.question = String(self.arrayOfQuestions[randomQuestion]["question"]!)
        self.answer = String(self.arrayOfQuestions[randomQuestion]["answer"]!)

    }
    func getRandomCorrectAnswer() -> Int! {
        return Int(arc4random_uniform(UInt32(4)))
    }
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
}