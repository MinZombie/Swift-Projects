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
    var filteredArr: [Candy] = []
    
    var isFiltering: Bool {
        let searchController = navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isEmpty = searchController?.searchBar.text?.isEmpty == false
        
        return isActive && isEmpty
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchData()
        
        
    }
    
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
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

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredArr.count : candies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var candy: Candy
        
        if isFiltering {
            candy = filteredArr[indexPath.row]
        } else {
            candy = candies[indexPath.row]
        }
        
        cell.textLabel?.text = candy.name
        cell.detailTextLabel?.text = candy.category
        
        return cell
    }
    
    
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text?.lowercased() else {
            return
        }
        
        filteredArr = candies.filter { $0.name.lowercased().contains(text) }
        tableView.reloadData()
    }
    
    
}
