//
//  PostViewModel.swift
//  swiftProject
//
//  Created by Gautam Yadav on 01/06/26.
//

import UIKit
import Foundation

protocol PostViewModelDelegate: AnyObject{
    func getApiData(_ data: AuthResponse)
    func getApiError(error: Error)
}
class PostViewModel{
    
    weak var delegate: PostViewModelDelegate?
    var repsitory =  PostAPIRepository()
    
    func postPatient(patient: AuthModel){
        
        repsitory.postApiPatients(patient){ [weak self] Result in
            DispatchQueue.main.async{
                switch Result{
                case .success(let data):
                        self?.delegate?.getApiData(data)
                case .failure(let error):
                        self?.delegate?.getApiError(error: error)
                }
            }
        }
    }
}
