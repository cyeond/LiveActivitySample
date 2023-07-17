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
    @IBOutlet weak var imageView: UIImageView!
    
    private var changeTitleAlertController: UIAlertController?
    private var phPicker: PHPickerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureChangeTitleAlertController()
        self.configurePHPicker()
        
    }
    
    private func configureChangeTitleAlertController() {
        let alertController = UIAlertController(title: "Change Title", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let text = alertController.textFields?.first?.text, !text.isEmpty {
                DispatchQueue.main.async {
                    self.titleLabel.text = text
                    alertController.textFields?.first?.text = ""
                }
            }
        }
        alertController.addTextField()
        alertController.addAction(okAction)
        
        self.changeTitleAlertController = alertController
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
        if let title = titleLabel.text, !title.isEmpty {
            LiveActivityManager.shared.updateActivity(title: title, time: Date() + 60.0)
        }
    }
    
    @IBAction func changeTitle(_ sender: UIButton) {
        guard let alert = self.changeTitleAlertController else {
            // handle error
            return
        }
        
        self.present(alert, animated: true)
    }
    
    @IBAction func changeImage(_ sender: UIButton) {
        guard let phPicker = self.phPicker else {
            // handle error
            return
        }
        
        self.present(phPicker, animated: true)
    }
}

// MARK: PHPickerViewControllerDelegate
extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true)
        
        if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                guard let image = image as? UIImage else {
                    // handle error
                    return
                }
                DispatchQueue.main.async {
                    self.imageView.image = image.resize(newWidth: 100.0)
                }
            }
        } else {
            // handle error
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
