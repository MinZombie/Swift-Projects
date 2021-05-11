//
//  ViewController.swift
//  Project 04 - Todo
//
//  Created by meister on 2021/05/11.
//

import UIKit

class ViewController: UIViewController {
    
    var data: Model?

    @IBOutlet weak var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTableView.dataSource = self
    }
    
    // modal 방식인 뷰를 닫아도 viewWillAppear가 호출되지 않아 데이터가 리로드 되지 않고 있음
    // 해결방법은 notification 활용
    // notification 공부하고 다시 시작
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        todoTableView.reloadData()
//    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        cell.textLabel?.text = Model.dummy[indexPath.row].task
        cell.detailTextLabel?.text = Model.dummy[indexPath.row].date.description
        
        return cell
    }
    
    
}
