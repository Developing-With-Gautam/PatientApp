//
//  PatientViewController.swift
//  swiftProject
//
//  Created by Gautam Yadav on 01/06/26.
//

import UIKit

class PatientViewController: UIViewController{
    
    let viewModel = PostViewModel()
    let getViewModel = GETViewModel()
    
    var data: [PatientDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        getViewModel.delegate = self
        login()
    }
    
    func login(){
        let authData = AuthModel(
            deviceType: "IOS",
            password: "Anisha@123",
            description: "iPhone",
            locationId: 2,
            userName: "Dr Anisha Teleconsult",
            accountId: 546818,
            deviceId: "5B215D2D-BC55-4B03-B96C-2788E25B6AEC",
            deviceToken: "DEVICE_TOKEN",
            accountType: ["Provider"]
        )
        
        viewModel.postPatient(patient: authData)
    }
}

extension PatientViewController: PostViewModelDelegate{
    func getApiData(_ data: AuthResponse) {
        print("Login Success")
        getViewModel.getPatientData(data)
    }
    
    func getApiError(error: any Error) {
        print(error)
    }
}

extension PatientViewController:  GetViewModelDelegate {
    func getAPiData(_ data: [PatientDataModel]) {
        print("Patients Received:", data.count)
        print("Navigation Controller:", navigationController as Any)

        DispatchQueue.main.async {
            let vc = PatientDataViewController(data: data)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func getAPiError(_ error: any Error) {
        print(error)
    }
    

}
