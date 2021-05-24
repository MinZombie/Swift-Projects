//
//  ViewController.swift
//  Project 05 - Auteurs
//
//  Created by meister on 2021/05/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var result: Auteurs?
    
    func parseJSON() {
        guard let path = Bundle.main.path(forResource: "auteurs", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        
        do {
            let data = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Auteurs.self, from: data)
        } catch {
            print("Error : \(error)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        parseJSON()
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.auteurs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "auteurCell", for: indexPath) as! AuteurTableViewCell
        let auteur = result?.auteurs[indexPath.row]
        
        cell.auteurImageView.image = UIImage(named: auteur?.image ?? "")
        cell.nameText.text = auteur?.name
        cell.bioText.text = auteur?.bio
        cell.sourceText.text = auteur?.source
        
        cell.auteurImageView.layer.cornerRadius = cell.auteurImageView.frame.width / 2
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}
