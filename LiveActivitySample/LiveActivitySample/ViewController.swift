//
//  ViewController.swift
//  LiveActivitySample
//
//  Created by YD on 2023/07/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTF.delegate = self
    }
    
    @IBAction func changeName(_ sender: UIButton) {
        if let name = nameTF.text, !name.isEmpty {
            nameLabel.text = name
            LiveActivityManager.shared.updateActivity(name: name)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

