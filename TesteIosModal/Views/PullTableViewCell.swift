//
//  PullTableViewCell.swift
//  TesteIosModal
//
//  Created by VICTOR FELIPPE MAGDESIAN on 17/12/21.
//

import UIKit

class PullTableViewCell: UITableViewCell {

    static let identifier = "PullTableViewCell"
    
    var date: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    var body : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.numberOfLines = .max
        return label
    }()
    
    let icon : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")
        return image
    }()
    
    var ownerName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    var ownerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var title : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        contentView.addSubview(title)
        ownerView.addSubview(icon)
        ownerView.addSubview(ownerName)
        contentView.addSubview(ownerView)
        contentView.addSubview(date)
        contentView.addSubview(body)
        addConstraints()
    }
    
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()

      
        constraints.append(ownerView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(ownerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor))
        constraints.append(ownerView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(ownerView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 15))
        
        constraints.append(title.leadingAnchor.constraint(equalTo: ownerView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(title.topAnchor.constraint(equalTo: ownerView.safeAreaLayoutGuide.bottomAnchor, constant: 5))
        constraints.append(title.trailingAnchor.constraint(equalTo: ownerView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(title.bottomAnchor.constraint(equalTo: ownerView.safeAreaLayoutGuide.bottomAnchor, constant: 30))
        
        constraints.append(ownerName.leadingAnchor.constraint(equalTo: ownerView.safeAreaLayoutGuide.leadingAnchor, constant: 30))
        
        constraints.append(date.leadingAnchor.constraint(equalTo: title.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(date.topAnchor.constraint(equalTo: title.safeAreaLayoutGuide.bottomAnchor, constant: 15))
        constraints.append(date.trailingAnchor.constraint(equalTo: title.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(date.bottomAnchor.constraint(equalTo: title.safeAreaLayoutGuide.bottomAnchor, constant: 30))
        
        constraints.append(body.leadingAnchor.constraint(equalTo: date.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(body.topAnchor.constraint(equalTo: date.safeAreaLayoutGuide.bottomAnchor, constant: 15))
        constraints.append(body.trailingAnchor.constraint(equalTo: date.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(body.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
