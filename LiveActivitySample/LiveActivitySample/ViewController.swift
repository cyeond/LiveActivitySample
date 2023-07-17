//
//  ViewController.swift
//  LiveActivitySample
//
//  Created by YD on 2023/07/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleTF.delegate = self
    }
    
    @IBAction func changeTitle(_ sender: UIButton) {
        if let title = titleTF.text, !title.isEmpty {
            titleLabel.text = title
            LiveActivityManager.shared.updateActivity(title: title, time: Date() + 60.0)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

