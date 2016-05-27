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
        var selected: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        if(selected != nil) {
        print(selected!)
        }
    }
}