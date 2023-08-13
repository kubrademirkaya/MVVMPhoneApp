//
//  ContactsTableViewCell.swift
//  PhoneApp
//
//  Created by Kübra Demirkaya on 8.08.2023.
//

import UIKit
import SnapKit

class ContactsTableViewCell: UITableViewCell {
    
    private lazy var labelNameSurname:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium" , size: 16)
        return label
    }()
    
//    private lazy var labelSurname:UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: "AvenirNext-Medium" , size: 18)
//        return label
//    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required  init?(coder: NSCoder) {
        fatalError(" ")
    }
    
    public func configure(model: Person) {
        
        labelNameSurname.text = model.name + " " + model.surname
        
    }
    
    public func setupViews() {
        
        self.contentView.backgroundColor = .white
        
        self.addSubview(labelNameSurname)
        
       setupLayout()
    }
    
    public func setupLayout() {
        
        labelNameSurname.snp.makeConstraints { label in
            //label.top.equalTo(self.contentView.safeAreaLayoutGuide.snp.top)
            label.leading.equalToSuperview().offset(16)
            label.trailing.equalToSuperview().offset(16)
            label.centerY.equalToSuperview()
        }
    }

}
