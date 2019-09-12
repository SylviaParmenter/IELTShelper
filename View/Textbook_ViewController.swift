//
//  Textbook_ViewController.swift
//  SeeCampus
//
//  Created by Yong Yang on 7/11/19.
//  Copyright © 2019 Edison Yang. All rights reserved.
//

import UIKit

class Textbook_ViewController: UIViewController {
    @IBOutlet weak var Back_Button: UIButton!
    @IBAction func dismiss_the_view(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Back_Button.layer.cornerRadius = Back_Button.frame.size.width/2
    }
}
