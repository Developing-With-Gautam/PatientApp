//
//  GetApiRepository.swift
//  swiftProject
//
//  Created by Gautam Yadav on 01/06/26.
//
import Foundation

class GetApiRepository{

    func getAPIRepostory(locationId: Int, referenceId: Int, token: String, completion: @escaping(Result<[PatientDataModel], Error>) -> Void){
        let url = "https://uat.careaxes.net/ff-test-api/api/appointments/fetch-provider-patients?locationId=\(locationId)&providerId=\(referenceId)"
        
        guard let urlString = URL(string: url) else { return }
        
        var urlRequest = URLRequest(url: urlString)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue(token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: urlRequest){ (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else{
                completion(.failure(NSError(domain: "data not found", code: -1)))
                return
            }
            
            do{
                let patientData = try JSONDecoder().decode([PatientDataModel].self, from: data)
                completion(.success(patientData))
            }
            catch{
                completion(.failure(NSError(domain: "unable to fethch the data", code: -1)))
                return
            }
            
        }.resume()
    }
}
