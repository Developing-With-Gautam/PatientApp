//
//  PatientDataViewController.swift
//  swiftProject
//
//  Created by Gautam Yadav on 02/06/26.
//

import UIKit

class PatientDataViewController: UIViewController{
    
    lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.text = "Patient Data"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    lazy var textField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Search"
        txt.borderStyle = .roundedRect
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.addTarget(self, action: #selector(didFiterTextField), for: .editingChanged)
        return txt
    }()

    
    var data:[PatientDataModel] = []
    var filteredData: [PatientDataModel] = []
    
    init(data: [PatientDataModel]) {
        self.data = data
        self.filteredData = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = "Patient Data"
        view.addSubview(tableView)
        view.addSubview(textField)
        view.backgroundColor = .systemYellow
        tableView.separatorStyle = .none
        
        tableView.register(PatientTableViewCell.self, forCellReuseIdentifier: PatientTableViewCell.identifier)
        tableView.delegate  = self
        tableView.dataSource = self
        
        setUpUI()
    }
    
    func setUpUI(){

        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        tableView.topAnchor.constraint(equalTo: textField.bottomAnchor,constant: 16).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16).isActive = true
    }
    
    @objc func didFiterTextField(_ textField: UITextField){
            
        let txt = textField.text ?? ""
        
        if txt.isEmpty{
            self.filteredData = data
            tableView.reloadData()
            return
        }
        
        else{
            
            filteredData = data.filter { Patient in
                
                let name = Patient.patientName?.lowercased().contains(txt.lowercased()) ?? false
                let mobileNumber = Patient.mobile?.contains(txt) ?? false
        
                return name || mobileNumber
            }
            
            tableView.reloadData()
            
        }
    }
}

extension PatientDataViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PatientTableViewCell.identifier, for: indexPath) as? PatientTableViewCell else {
            return UITableViewCell()
        }
        
        let data = self.filteredData[indexPath.row]
        cell.Config(with: data)
        cell.selectionStyle = .none
        return cell
    }
}
