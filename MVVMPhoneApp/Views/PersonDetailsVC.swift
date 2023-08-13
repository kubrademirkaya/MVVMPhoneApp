//
//  PersonDetailsVC.swift
//  PhoneApp
//
//  Created by Kübra Demirkaya on 9.08.2023.
//

import UIKit
import SnapKit

class PersonDetailsVC: UIViewController {
    
//    weak var delegate: PersonDetailsDelegate?
    
    var person: Person?
    
    private lazy var imageViewPerson: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50) // ImageView boyutları
        imageView.center = view.center // ImageView'ı ekranda merkeze al
        
        imageView.image = UIImage(named: "person") // Resim yükle
        imageView.contentMode = .scaleAspectFit // Resmin boyutunu uygun şekilde ölçeklendirir
        imageView.layer.cornerRadius = imageView.frame.size.width / 1 // Resmin kenarlarını yuvarlar
        imageView.clipsToBounds = true // Görüntünün kenarlarını keser

        return imageView
    }()
    
    private lazy var labelNameSurname:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium" , size: 24)
        label.text = person!.name + " " + person!.surname
        return label
    }()
    
    private lazy var stackViewButtons: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.axis = .horizontal
        return stackView
    }()

    
    private lazy var buttonMessage: UIButton = {
       
//        let image = UIImage(systemName: "message.fill")
//        button.setImage(image, for: .normal)
//        button.tintColor = .systemBlue
//
//        button.setTitle("Message", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
//        button.setTitleColor(.systemBlue, for: .normal)
//
//        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // Resim-metin boşluğu
//        button.titleEdgeInsets = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0) // Resim-metin boşluğu
//
        

        let imageView = UIImageView(image: UIImage(systemName: "message.fill"))
        imageView.contentMode = .scaleAspectFit
    

        let label = UILabel()
        label.text = "Message"
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.font = UIFont(name: "AvenirNext-Medium", size: 12)
        label.textAlignment = .center

        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 100, width: 150, height: 100)
//        button.imageView = UIImageView(image: UIImage(systemName: "message.fill"))
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        button.addTarget(self, action: #selector(buttonMessageTapped) , for: .touchUpInside)

        button.addSubview(imageView)
        button.addSubview(label)
        
        
        return button
    }()
    
    private lazy var buttonCall: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private lazy var buttonVideoCall: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private lazy var buttonMail: UIButton = {
        let button = UIButton()
        
        return button
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 30
        tableView.register(PersonDetailsTableViewCell.self, forCellReuseIdentifier: "PersonDetailsTableViewCell")
        return tableView
    }()
    
    @objc func buttonMessageTapped() {
        navigationController?.pushViewController(FavoritesVC(), animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()

    }
    
    func setupViews() {
        
        self.view.backgroundColor = #colorLiteral(red: 0.9498986602, green: 0.9449328184, blue: 0.9622316957, alpha: 1)
        
        
        
        
        stackViewButtons.addArrangedSubview(buttonMessage)
        stackViewButtons.addArrangedSubview(buttonCall)
        stackViewButtons.addArrangedSubview(buttonVideoCall)
        stackViewButtons.addArrangedSubview(buttonMail)
        
        self.view.addSubviews(imageViewPerson,
                              labelNameSurname,
                              stackViewButtons,
                              tableView)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        imageViewPerson.snp.makeConstraints { imageView in
            imageView.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            imageView.centerX.equalToSuperview()
            imageView.height.equalTo(100)
            imageView.width.equalTo(100)
        }
        
        labelNameSurname.snp.makeConstraints { label in
            label.top.equalTo(imageViewPerson.snp.bottom).offset(8)
            label.centerX.equalToSuperview()
        }
        
        stackViewButtons.snp.makeConstraints { stackView in
            stackView.top.equalTo(labelNameSurname.snp.bottom).offset(12)
            stackView.leading.equalToSuperview().offset(16)
            stackView.trailing.equalToSuperview().offset(16)
        }
        
        buttonMessage.snp.makeConstraints { button in
            button.width.equalTo(100)
            button.height.equalTo(75)
        }
        
        tableView.snp.makeConstraints { tableView in
            tableView.top.equalTo(stackViewButtons.snp.bottom).offset(12)
            tableView.leading.equalTo(stackViewButtons.snp.leading)
            tableView.trailing.equalTo(stackViewButtons.snp.trailing)
            
        }
        
    }
    

}

extension PersonDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonDetailsTableViewCell", for: indexPath) as? PersonDetailsTableViewCell else { return UITableViewCell() }
       
//        if let person = person {
//
//            labelNameSurname.text = person.name + " " + person.surname
//            var text = labelNameSurname.text
//            print(text)
//
//        } else {
//
//            return cell
//
//        }
            
        return cell
    }
}

