//
//  DetailViewController.swift
//  Project 05 - Auteurs
//
//  Created by meister on 2021/05/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var films: [Film]!
    let readMoreText: String = "Read more"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath) as! FilmTableViewCell
        let film = films[indexPath.row]
        
        cell.titleLabel.text = film.title
        cell.yearLabel.text = film.year
        cell.posterImageView.image = UIImage(named: film.poster)
        cell.plotLabel.text = film.isExpanded ? film.plot : readMoreText
        cell.plotLabel.textAlignment = film.isExpanded ? .left : .center
        
        return cell
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? FilmTableViewCell else {
            return
        }
        var film = films[indexPath.row]
        
        film.isExpanded = !film.isExpanded
        films[indexPath.row] = film
        
        cell.plotLabel.text = film.isExpanded ? film.plot : readMoreText
        cell.plotLabel.textAlignment = film.isExpanded ? .left : .center
        
        tableView.beginUpdates()
        tableView.endUpdates()
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        
    }
}

