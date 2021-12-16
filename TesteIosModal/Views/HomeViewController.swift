//
//  ViewController.swift
//  TesteIosModal
//
//  Created by VICTOR FELIPPE MAGDESIAN on 14/12/21.
//

import UIKit
import Alamofire

class HomeViewController: UITableViewController {
    
    var coordinator: MainCoordinator?
    var repositories: [Repository]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Swift Repositories"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RepositoryCell")
        APIClient.shared.getRepositories().responseString{
            response in
            switch(response.result){
            
                case.success(let responseString):
                    let repos = ApiResponse(JSONString: "\(responseString)")
                    self.repositories = repos?.repositories
                    self.coordinator?.repositoriesStore = self.repositories
                    self.tableView.reloadData()
                    self.coordinator?.detail(index: 0)
        
                case.failure(let error):
                    print(error)
            
            }
        }
    }
              
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories!.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath)
        cell.textLabel?.text = self.repositories![indexPath.row].repositoryName
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailsViewController{
//            vc.selectedImage = pictures[indexPath.row]
//            navigationController?.pushViewController(vc, animated: true)
//        }
//    }


}
