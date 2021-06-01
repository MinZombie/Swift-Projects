//
//  ViewController.swift
//  Project 06 - CandySearch
//
//  Created by meister on 2021/06/01.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var candies: [Candy] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        fetchData()
        
    }

    func fetchData() {
        guard let path = Bundle.main.path(forResource: "candies", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            
            let data = try Data(contentsOf: url)
            candies = try JSONDecoder().decode([Candy].self, from: data)
            
        } catch {
            print("error: \(error)")
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return candies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let candy = candies[indexPath.row]
        
        
        cell.textLabel?.text = candy.name
        cell.detailTextLabel?.text = candy.category
        
        return cell
    }
    
    
}
