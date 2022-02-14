//
//  DropDownCell.swift
//  DropDownMenuTutorial
//
//  Created by Paolo Prodossimo Lopes on 21/09/21.
//

import UIKit

class DropDownCell: UITableViewCell {
    
    //MARK: - Properties
    
    let viewContainer = UIView()
    let titleLabel = UILabel()
    
    //MARK: - Lyfecicle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    fileprivate func configureCell() {
        addSubview(viewContainer)
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        viewContainer.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        viewContainer.layer.cornerRadius = 5
        
        viewContainer.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        viewContainer.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        viewContainer.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        
        viewContainer.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    //MARK: - Selectors
    
}
