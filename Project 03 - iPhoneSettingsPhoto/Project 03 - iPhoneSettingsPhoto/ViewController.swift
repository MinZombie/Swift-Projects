//
//  ViewController.swift
//  Project 03 - iPhoneSettingsPhoto
//
//  Created by meister on 2021/05/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let list = Section.data()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let target = list[indexPath.section].items[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath)
        
        cell.textLabel?.text = target.title
        
        switch target.type {
        case .disclosure:
            cell.imageView?.image = UIImage(systemName: target.imageName ?? "")
            
        case .switch:
            
            break
            
        case .sheet:
            break
            
        case .checkmark:
            
            cell.accessoryType = target.on ? .checkmark : .none
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section].header
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return list[section].footer
    }
}
