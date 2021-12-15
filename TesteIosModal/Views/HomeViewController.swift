//
//  ViewController.swift
//  TesteIosModal
//
//  Created by VICTOR FELIPPE MAGDESIAN on 14/12/21.
//

import UIKit
import RxSwift

class HomeViewController: UITableViewController {
    
    var repositories: [Repository] = []
    let api = APIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Swift Repositories"
        api.execute(URL(string: "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1")!)
    }
              
    
    let textLabel : UILabel = {
        let label = UILabel()
        label.text = "TESTE"
        return label
        
    }()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.addSubview(textLabel)
        return cell
    }


}
