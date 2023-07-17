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
    
    @IBAction func start(_ sender: UIButton) {
        if let title = titleLabel.text, !title.isEmpty {
            LiveActivityManager.shared.startActivity(title: title, time: Date())
        }
    }
    
    @IBAction func stop(_ sender: UIButton) {
        LiveActivityManager.shared.stopActivity()
    }
    
    @IBAction func update(_ sender: UIButton) {
        if let title = titleTF.text, !title.isEmpty {
            titleLabel.text = title
            titleTF.text = ""
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

