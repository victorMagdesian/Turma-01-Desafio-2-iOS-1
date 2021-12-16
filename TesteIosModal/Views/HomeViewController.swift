//
//  ViewController.swift
//  TesteIosModal
//
//  Created by VICTOR FELIPPE MAGDESIAN on 14/12/21.
//

import UIKit
import Alamofire

class HomeViewController: UITableViewController {
    
    var repositories: [Repository]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Swift Repositories"
        APIClient.shared.getRepositories().responseString{
            response in
            switch(response.result){
            
                case.success(let responseString):
                    let repos = ApiResponse(JSONString: "\(responseString)")
                    self.repositories = repos?.repositories
                    self.tableView.reloadData()
        
                case.failure(let error):
                    print(error)
            
            }
        }
    }
              
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories!.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       RepositoryViewCell()
        
    }


}
