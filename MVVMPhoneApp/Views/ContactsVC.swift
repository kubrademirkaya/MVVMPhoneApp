//
//  ContactsVC.swift
//  PhoneApp
//
//  Created by Kübra Demirkaya on 8.08.2023.
//

import UIKit
import SnapKit

//protocol PersonDetailsDelegate: AnyObject {
//    func dataTransfer(indexPath: IndexPath)
//}

class ContactsVC: UIViewController {
    
    let personArray: [Person] = [
        Person(name: "Alice", surname: "Johnson", email: "alice@example.com", phoneNumber: "1234567890", image: "alice.jpg", isFavorite: true),
        Person(name: "Brendan", surname: "Miller", email: "brendan@example.com", phoneNumber: "2345678901", image: "brendan.jpg", isFavorite: false),
        Person(name: "Catherine", surname: "Smith", email: "catherine@example.com", phoneNumber: "3456789012", image: "catherine.jpg", isFavorite: true),
        Person(name: "David", surname: "Brown", email: "david@example.com", phoneNumber: "4567890123", image: "david.jpg", isFavorite: false),
        Person(name: "Emma", surname: "Davis", email: "emma@example.com", phoneNumber: "5678901234", image: "emma.jpg", isFavorite: true),
        Person(name: "Frank", surname: "Wilson", email: "frank@example.com", phoneNumber: "6789012345", image: "frank.jpg", isFavorite: false),
        Person(name: "Grace", surname: "Taylor", email: "grace@example.com", phoneNumber: "7890123456", image: "grace.jpg", isFavorite: true),
        Person(name: "Henry", surname: "Anderson", email: "henry@example.com", phoneNumber: "8901234567", image: "henry.jpg", isFavorite: false),
        Person(name: "Isabella", surname: "Martinez", email: "isabella@example.com", phoneNumber: "9012345678", image: "isabella.jpg", isFavorite: true),
        Person(name: "Jack", surname: "Clark", email: "jack@example.com", phoneNumber: "0123456789", image: "jack.jpg", isFavorite: false),
        Person(name: "Katherine", surname: "Wright", email: "katherine@example.com", phoneNumber: "1234509876", image: "katherine.jpg", isFavorite: true),
        Person(name: "Liam", surname: "Garcia", email: "liam@example.com", phoneNumber: "2345610987", image: "liam.jpg", isFavorite: false),
        Person(name: "Mia", surname: "Lee", email: "mia@example.com", phoneNumber: "3456721098", image: "mia.jpg", isFavorite: true),
        Person(name: "Noah", surname: "Perez", email: "noah@example.com", phoneNumber: "4567832109", image: "noah.jpg", isFavorite: false),
        Person(name: "Olivia", surname: "Harris", email: "olivia@example.com", phoneNumber: "5678943210", image: "olivia.jpg", isFavorite: true),
        Person(name: "Penelope", surname: "Allen", email: "penelope@example.com", phoneNumber: "6789054321", image: "penelope.jpg", isFavorite: false),
        Person(name: "Quinn", surname: "Bell", email: "quinn@example.com", phoneNumber: "7890165432", image: "quinn.jpg", isFavorite: true),
        Person(name: "Ryan", surname: "Adams", email: "ryan@example.com", phoneNumber: "8901276543", image: "ryan.jpg", isFavorite: false),
        Person(name: "Sophia", surname: "King", email: "sophia@example.com", phoneNumber: "9012387654", image: "sophia.jpg", isFavorite: true),
        Person(name: "Thomas", surname: "Young", email: "thomas@example.com", phoneNumber: "0123498765", image: "thomas.jpg", isFavorite: false)
    ]

    
    var sectionArray = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "#"]

    var sortedArray = [[Person]]()
    
//    private lazy var stackViewHeader: UIStackView = {
//        let stackView = UIStackView()
//        stackView.distribution = .fillProportionally
//        stackView.spacing = 20
//        stackView.axis = .horizontal
//        return stackView
//    }()
//
//    private lazy var buttonGroups: UIButton = {
//        let button = UIButton()
//        button.setTitle("Groups", for: .normal)
//        button.backgroundColor = .clear
//        button.setTitleColor(.blue, for: .normal)
//        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
//
//        //button.addTarget(self, action: #selector(buttonEditTapped), for: .touchUpInside)
//        return button
//    }()
//
//    private lazy var buttonAddPerson: UIButton = {
//        let button = UIButton()
//        button.setTitle("+", for: .normal)
//        button.backgroundColor = .clear
//        button.setTitleColor(.blue, for: .normal)
//        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
//        //button.addTarget(self, action: #selector(buttonEditTapped), for: .touchUpInside)
//        return button
//    }()
    
    private lazy var labelHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Bold" , size: 24)
        label.text = "Contacts"
        label.textAlignment = .left
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 30
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: "ContactsTableViewCell")
        return tableView
    }()
    
    func filterAndSort() {

        sectionArray.enumerated().forEach { index, char in
            let filtered = personArray.filter({ $0.name.hasPrefix(char) }).sorted(by: { $0.name < $1.name })
            print("1.", filtered)
            if filtered.count > 0 {
                sortedArray.append(filtered)
                print(filtered)
            } else {
                sectionArray.remove(at: index)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       filterAndSort()
        
        setupViews()
    }
    
    func setupViews() {
        
        self.view.backgroundColor = .white
        
//        stackViewHeader.addArrangedSubview(buttonGroups)
//        stackViewHeader.addArrangedSubview(buttonAddPerson)
        
//        self.view.addSubview(stackViewHeader)
        self.view.addSubview(labelHeader)
        self.view.addSubview(tableView)
        
        setupLayout()
        
    }
    
    func setupLayout() {
        
//        stackViewHeader.snp.makeConstraints { stackView in
//            stackView.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
//            stackView.leading.equalToSuperview()
//            stackView.trailing.equalToSuperview()
//        }
//        
        labelHeader.snp.makeConstraints { label in
            label.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            label.leading.equalToSuperview().offset(8)
            label.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { tableView in
            tableView.top.equalTo(labelHeader.snp.bottom)
            tableView.leading.equalTo(labelHeader.snp.leading)
            tableView.trailing.equalTo(labelHeader.snp.trailing)
            tableView.bottom.equalToSuperview()
        }
    }

}

extension ContactsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionArray[section].count
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell", for: indexPath) as? ContactsTableViewCell else { return UITableViewCell() }
        
        let userInSection = sortedArray[indexPath.section]
        let model = userInSection[indexPath.row]
        print(model)
        cell.configure(model: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionArray
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let personInSection = sortedArray[indexPath.section]
        let selectedPerson = personInSection[indexPath.row]
        print(selectedPerson)
        
        let personDetailVC = PersonDetailsVC()
//        personDetailVC.delegate = self
        personDetailVC.person = selectedPerson
        navigationController?.pushViewController(personDetailVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated:  true)

    }
    
}

//extension ContactsVC: PersonDetailsDelegate {
//
//    func dataTransfer(indexPath: IndexPath) {
//
//    }
//
//}

