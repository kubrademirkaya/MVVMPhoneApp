//
//  FavoritesVC.swift
//  PhoneApp
//
//  Created by Kübra Demirkaya on 8.08.2023.
//

import UIKit
import SnapKit

class FavoritesVC: UIViewController {
   
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 30
        tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: "FavoritesTableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()

    }
    
    func setupViews() {
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(tableView)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        tableView.snp.makeConstraints { tableView in
            tableView.edges.equalToSuperview()
        }
        
    }

}

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as? FavoritesTableViewCell else { return UITableViewCell() }
       
        
        return cell
    }
}
