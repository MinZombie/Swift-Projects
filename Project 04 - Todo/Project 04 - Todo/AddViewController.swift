//
//  AddViewController.swift
//  Project 04 - Todo
//
//  Created by meister on 2021/05/11.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textField: UITextView!
    
    @IBAction func saveButton(_ sender: Any) {
        guard let text = textField.text else {return}

        Model.dummy.append(Model(task: text))
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
