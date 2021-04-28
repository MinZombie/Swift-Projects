//
//  TableViewController.swift
//  Project 01 - Dortmund
//
//  Created by meister on 2021/04/22.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        let data = Data.list[indexPath.row]
        
        cell.cellImageView.image = UIImage(named: data.imageName)
        cell.cellLabel.text = data.name
        
        return cell
    }
    
    
}

