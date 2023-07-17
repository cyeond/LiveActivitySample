//
//  ViewController.swift
//  LiveActivitySample
//
//  Created by YD on 2023/07/16.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    private var phPicker: PHPickerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleTF.delegate = self
        self.configurePHPicker()
        
    }
    
    private func configurePHPicker() {
        var pickerConfig = PHPickerConfiguration()
        pickerConfig.filter = .images
        pickerConfig.selectionLimit = 1
        
        self.phPicker = PHPickerViewController(configuration: pickerConfig)
        self.phPicker?.delegate = self
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
    
    @IBAction func changeImage(_ sender: UIButton) {
        guard let phPicker = self.phPicker else {
            //
            return
        }
        
        self.present(phPicker, animated: true)
    }
}

// MARK: UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: PHPickerViewControllerDelegate
extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true)
        
        if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                guard let image = image as? UIImage else {
                    //
                    return
                }
                DispatchQueue.main.async {
                    self.imageView.image = image.resize(newWidth: 100.0)
                }
            }
        } else {
            //
        }
    }
}

extension UIImage {
    func resize(newWidth: CGFloat) -> UIImage {
        let size = CGSize(width: newWidth, height: newWidth)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return renderImage
    }
}
