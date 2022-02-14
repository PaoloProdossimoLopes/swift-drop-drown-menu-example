//
//  ViewController.swift
//  DropDownMenuTutorial
//
//  Created by Paolo Prodossimo Lopes on 21/09/21.
//

import UIKit

private let DROP_DOW_CELL_IDENTIFIER = "DropDownCellIdentifier"

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    var tableView = UITableView()
    let coloViewExample = UIView()
    
    var showMenu: Bool = false
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    
    fileprivate func configureUI() {
        configureTableView()
        configureColorExample()
        
    }
    
    fileprivate func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DropDownCell.self, forCellReuseIdentifier: DROP_DOW_CELL_IDENTIFIER)
        
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.rowHeight = 50
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    fileprivate func configureColorExample() {
        coloViewExample.backgroundColor = .systemGray
        coloViewExample.layer.cornerRadius = 10
        
        view.addSubview(coloViewExample)
        coloViewExample.translatesAutoresizingMaskIntoConstraints = false
        coloViewExample.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 50).isActive = true
        coloViewExample.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        coloViewExample.heightAnchor.constraint(equalToConstant: 200).isActive = true
        coloViewExample.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    //MARK: - Selectors
    
    @objc private func handleDropDown() {
        print("DoropDown tapped")
        
        showMenu.toggle()
        
        var indexPaths = [IndexPath]()
        
        Colors.allCases.forEach { (color) in
            let indexPath = IndexPath(row: color.rawValue, section: 0)
            indexPaths.append(indexPath)
        }
        
        if showMenu {
            tableView.insertRows(at: indexPaths, with: .fade)
        } else {
            tableView.deleteRows(at: indexPaths, with: .fade)
        }
    }
    
}

//MARK: - UITableView Delegate and DataSouce

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return configureHeaderButtonInSetions()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showMenu ? Colors.allCases.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        configureTableViewCell(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let color = Colors(rawValue: indexPath.row) else { return }
        coloViewExample.backgroundColor = color.color
    }
    
    fileprivate func configureHeaderButtonInSetions() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Select color", for: .normal)
        button.backgroundColor = .systemIndigo
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleDropDown), for: .touchUpInside)
        return button
    }
    
    fileprivate func configureTableViewCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DROP_DOW_CELL_IDENTIFIER, for: indexPath) as! DropDownCell
        guard let colors = Colors(rawValue: indexPath.row) else { return UITableViewCell()}
        cell.viewContainer.backgroundColor = colors.color
        cell.titleLabel.text = colors.colorName
        return cell
    }
    
    
}

