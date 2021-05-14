//
//  AddViewController.swift
//  Project 04 - Todo
//
//  Created by meister on 2021/05/11.
//

import UIKit

class AddViewController: UIViewController {
    
    var callback: ((Model) -> Void)?

    @IBOutlet weak var textField: UITextView!
    
    @IBAction func saveButton() {
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        callback?(Model(task: text))
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension Notification.Name {
    static let value = Notification.Name("valueNotification")
}
