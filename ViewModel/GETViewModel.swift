//
//  GETViewModel.swift
//  swiftProject
//
//  Created by Gautam Yadav on 01/06/26.
//

import Foundation

protocol GetViewModelDelegate: AnyObject{
    func getAPiData(_ data: [PatientDataModel])
    func getAPiError(_ error: Error)
}

class GETViewModel{
    
    weak var delegate: GetViewModelDelegate?
    let repository = GetApiRepository()
    
    func getPatientData(_ data: AuthResponse){
        
        repository.getAPIRepostory(locationId: data.locationId ?? 0 , referenceId: data.referenceId ?? 0, token: data.token ?? "") { [weak self] Result in
            
           DispatchQueue.main.async{
                
                switch Result{
                case .success(let data):
                    self?.delegate?.getAPiData(data)
                case .failure(let error):
                    self?.delegate?.getAPiError(error)
                }
            }
        }
    }
}
