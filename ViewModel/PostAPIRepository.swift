//
//  PostAPI.swift
//  swiftProject
//
//  Created by Gautam Yadav on 31/05/26.
//

//  "https://uat.careaxes.net/ff-test-api/api/account/authenticate" postAPi

// "https://uat.careaxes.net/ff-test-api/api/appointments/fetch-provider-patients?locationId=\(locationId)&providerId=\(referenceId)"

import Foundation

class PostAPIRepository {
    
    let url = "https://uat.careaxes.net/ff-test-api/api/account/authenticate"
    
    func postApiPatients(_ patient: AuthModel, completion: @escaping(Result<AuthResponse,Error>)->Void){
        guard let url = URL(string: url) else{
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do{
            let userData = try JSONEncoder().encode(patient)
            urlRequest.httpBody = userData
            
            URLSession.shared.dataTask(with: urlRequest){ data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else{
                    completion(.failure(NSError(domain: "No data found", code: -1)))
                    return
                }
                
                do{
                    let userResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
                    completion(.success(userResponse))
                }
                catch{
                    completion(.failure(NSError(domain: "No data found", code: -1)))
                }
                
            }.resume()
        }
        catch{
            completion(.failure(NSError(domain: "data is not in valid format", code: -1)))
            return
        }
    }
}
