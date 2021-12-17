//
//  DetailsViewController.swift
//  TesteIosModal
//
//  Created by VICTOR FELIPPE MAGDESIAN on 16/12/21.
//

import UIKit
import AlamofireImage
import Alamofire

class DetailsViewController: UIViewController{

    var coordinator: MainCoordinator?
    var indexRepositoriesStore: Int = 0
    
    private let centerView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let autor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 3
        label.font = UIFont(name: label.font.fontName, size: 32)
        return label
    }()
    
    private let descricao: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = .max
        label.sizeToFit()
        return label
    }()
    
    private let stars: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: label.font.fontName, size: 28)
        return label
    }()
    
    private let forks: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: label.font.fontName, size: 28)
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        
//DEVIDO A BLOQUEIO DO PROXY MODAL NÃO CONSEGUI REALIZAR O DOWNLOAD DO AVATAR
        
//        AF.request("https://avatars.githubusercontent.com/u/484656?v=4").responseImage{
//            response in
//
//            switch(response.result){
//            case .success(let responseImage):
//                image.image = responseImage
//                let parent = image.superview
//                image.removeFromSuperview()
//                parent?.addSubview(image)
//
//            case .failure(let error):
//                print(error)
//            }
//
//        }
        image.image = UIImage(systemName: "person")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let tablePr: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = .systemGray2
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = coordinator?.repositoriesStore?[indexRepositoriesStore].fullName
        view.backgroundColor = .white
        view.addSubview(centerView)
        centerView.addSubview(image)
        autor.text = "Autor: \((coordinator?.repositoriesStore?[indexRepositoriesStore].owner?.name)!)"
        centerView.addSubview(autor)
        forks.text = "Forks: \((coordinator?.repositoriesStore?[indexRepositoriesStore].forksCount)!)"
        centerView.addSubview(forks)
        stars.text = "Stars: \((coordinator?.repositoriesStore?[indexRepositoriesStore].starsCount)!)"
        centerView.addSubview(stars)
        descricao.text = "Descrição: \((coordinator?.repositoriesStore?[indexRepositoriesStore].description)!)"
        centerView.addSubview(descricao)
        tablePr.dataSource = self
        centerView.addSubview(tablePr)
        addConstraints()
        
        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tablePr.frame = CGRect(x: 0, y: view.bounds.height/2, width: view.bounds.width, height: view.bounds.height)
//    }
//
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(centerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(centerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(centerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(centerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        
        constraints.append(image.leadingAnchor.constraint(equalTo: centerView.safeAreaLayoutGuide.leadingAnchor, constant: 10))
        constraints.append(image.topAnchor.constraint(equalTo: centerView.safeAreaLayoutGuide.topAnchor, constant: 10))
        constraints.append(image.trailingAnchor.constraint(equalTo: centerView.safeAreaLayoutGuide.trailingAnchor, constant: -(view.bounds.width*0.5)))
        constraints.append(image.bottomAnchor.constraint(equalTo: centerView.safeAreaLayoutGuide.bottomAnchor, constant: -(view.bounds.height*0.5)))
        
        constraints.append(autor.leadingAnchor.constraint(equalTo: image.safeAreaLayoutGuide.trailingAnchor, constant: 10))
        constraints.append(autor.topAnchor.constraint(lessThanOrEqualTo: image.safeAreaLayoutGuide.topAnchor))
        constraints.append(autor.trailingAnchor.constraint(equalTo: image.safeAreaLayoutGuide.trailingAnchor, constant: view.bounds.width*0.5))
        constraints.append(autor.bottomAnchor.constraint(lessThanOrEqualTo: image.safeAreaLayoutGuide.bottomAnchor))
        
        constraints.append(forks.leadingAnchor.constraint(equalTo: image.safeAreaLayoutGuide.trailingAnchor, constant: 10))
        constraints.append(forks.topAnchor.constraint(equalTo: image.safeAreaLayoutGuide.topAnchor))
        constraints.append(forks.trailingAnchor.constraint(equalTo: image.safeAreaLayoutGuide.trailingAnchor, constant: view.bounds.width*0.5))
        constraints.append(forks.bottomAnchor.constraint(equalTo: image.safeAreaLayoutGuide.bottomAnchor))
        
        constraints.append(stars.leadingAnchor.constraint(equalTo: image.safeAreaLayoutGuide.trailingAnchor, constant: 10))
        constraints.append(stars.topAnchor.constraint(greaterThanOrEqualTo:  image.safeAreaLayoutGuide.topAnchor))
        constraints.append(stars.trailingAnchor.constraint(equalTo: image.safeAreaLayoutGuide.trailingAnchor, constant: view.bounds.width*0.5))
        constraints.append(stars.bottomAnchor.constraint(greaterThanOrEqualTo:  image.safeAreaLayoutGuide.bottomAnchor))

        constraints.append(descricao.leadingAnchor.constraint(equalTo: image.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(descricao.topAnchor.constraint(equalTo: image.safeAreaLayoutGuide.bottomAnchor, constant: 20))
        constraints.append(descricao.trailingAnchor.constraint(equalTo:  centerView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(descricao.bottomAnchor.constraint(equalTo: image.safeAreaLayoutGuide.bottomAnchor, constant: 100))
        
        
        constraints.append(tablePr.leadingAnchor.constraint(equalTo: centerView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(tablePr.topAnchor.constraint(equalTo: descricao.safeAreaLayoutGuide.bottomAnchor, constant: 20))
        constraints.append(tablePr.trailingAnchor.constraint(equalTo:  centerView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(tablePr.bottomAnchor.constraint(equalTo: centerView.safeAreaLayoutGuide.bottomAnchor))
        


        
        NSLayoutConstraint.activate(constraints)
    }

   

}

extension DetailsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    
}
