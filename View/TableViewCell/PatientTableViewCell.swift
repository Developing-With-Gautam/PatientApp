//
//  PatientTableViewCell.swift
//  swiftProject
//
//  Created by Gautam Yadav on 02/06/26.
//

import UIKit

class PatientTableViewCell: UITableViewCell {
    
    static let identifier = "PatientTableViewCell"
    lazy var nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Patient Name"
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lbl.textColor =  UIColor.black.withAlphaComponent(0.5)
        return lbl
    }()
    
    lazy var nameDetailLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Patient Name"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor =  UIColor.black
        return lbl
    }()
    
    lazy var nameStack: UIStackView = {
        let  stck = UIStackView()
        stck.axis = .vertical
        stck.translatesAutoresizingMaskIntoConstraints = false
        stck.spacing = 6
        return stck
    }()
    
    lazy var umrLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "UMR No"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lbl.textColor =  UIColor.black.withAlphaComponent(0.5)
        return lbl
    }()
    
    lazy var umrDetailLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor =  UIColor.black
        return lbl
    }()
    
    lazy var umrStack: UIStackView = {
        let  stck = UIStackView()
        stck.axis = .vertical
        stck.translatesAutoresizingMaskIntoConstraints = false
        stck.spacing = 6
        return stck
    }()
    
    lazy var profileImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.circle.fill")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var phoneDetailLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor =  UIColor.black
        return lbl
    }()
    
    lazy var addressDetailLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor =  UIColor.black
        return lbl
    }()
    
    lazy var totalStack: UIStackView = {
        let  stck = UIStackView()
        stck.translatesAutoresizingMaskIntoConstraints = false
        stck.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stck.isLayoutMarginsRelativeArrangement = true
        stck.axis = .vertical
        stck.spacing = 6
        return stck
    }()

    lazy var profileStack: UIStackView = {
        let  stck = UIStackView()
        stck.axis = .horizontal
        stck.translatesAutoresizingMaskIntoConstraints = false
        stck.spacing = 12
        return stck
    }()
    
    lazy var NameUmrStack: UIStackView = {
        let  stck = UIStackView()
        stck.axis = .vertical
        stck.translatesAutoresizingMaskIntoConstraints = false
        stck.spacing = 12
        return stck
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setUpUI()
        addConnstraints()
    }
    
    func setUpUI(){
        contentView.addSubview(totalStack)
        
        nameStack.addArrangedSubview(nameLbl)
        nameStack.addArrangedSubview(nameDetailLbl)

        umrStack.addArrangedSubview(umrLbl)
        umrStack.addArrangedSubview(umrDetailLbl)
        
        NameUmrStack.addArrangedSubview(nameStack)
        NameUmrStack.addArrangedSubview(umrStack)
        
        profileStack.addArrangedSubview(profileImage)
        profileStack.addArrangedSubview(NameUmrStack)
        
        totalStack.addArrangedSubview(profileStack)
        totalStack.addArrangedSubview(addressDetailLbl)
        totalStack.addArrangedSubview(phoneDetailLbl)
        totalStack.layer.borderColor = UIColor.black.cgColor
        totalStack.layer.cornerRadius = 10
        totalStack.layer.borderWidth = 1
    }
    
    func addConnstraints(){
        
        profileImage.trailingAnchor.constraint(equalTo: profileStack.leadingAnchor , constant: -16).isActive = true
        profileImage.leadingAnchor.constraint(equalTo: NameUmrStack.trailingAnchor, constant: 16).isActive = true
     
        profileImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        totalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6).isActive = true
        totalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6).isActive = true
        totalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        totalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    func Config(with data: PatientDataModel){
        
        nameDetailLbl.text = data.patientName
        umrDetailLbl.text = data.umrNo
        phoneDetailLbl.text = data.mobile
        addressDetailLbl.text = data.locationName
    }
}
