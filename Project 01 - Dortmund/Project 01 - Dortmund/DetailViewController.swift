//
//  DetailViewController.swift
//  Project 01 - Dortmund
//
//  Created by meister on 2021/04/30.
//

import UIKit

class DetailViewController: UIViewController {

    var data: Data?
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImage.image = UIImage(named: data?.imageName ?? "")
        detailLabel.text = data?.name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
