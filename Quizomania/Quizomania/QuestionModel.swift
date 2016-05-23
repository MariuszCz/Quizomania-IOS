//
//  QuestionModel.swift
//  Quizomania
//
//  Created by Mariusz Czeszejko-Sochacki on 23/05/16.
//  Copyright © 2016 Mariusz Czeszejko-Sochacki. All rights reserved.
//

import Foundation
class QuestionModel {
    
   
    var question: String
    var answer: String
    var categoryId: String
    
    init(question: String, answer: String, categoryId: String) {
        self.question = question
        self.answer = answer
        self.categoryId = categoryId
    }
    
}