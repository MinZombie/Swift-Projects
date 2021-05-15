//
//  ViewController.swift
//  Project 04 - Todo
//
//  Created by meister on 2021/05/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    let dateFormatter: DateFormatter = {
       var date = DateFormatter()
        date.dateStyle = .medium
        date.timeStyle = .short
        return date
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTableView.dataSource = self

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let vc = segue.destination as? AddViewController {

            vc.callback = { result in
                
                Model.dummy.append(result)
                self.todoTableView.reloadData()
               
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        cell.textLabel?.text = Model.dummy[indexPath.row].task
        cell.detailTextLabel?.text = dateFormatter.string(from: Model.dummy[indexPath.row].date)
        
        return cell
    }
    
    
}
