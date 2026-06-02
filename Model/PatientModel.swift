//
//  PatientModel.swift
//  swiftProject
//
//  Created by Gautam Yadav on 31/05/26.
//


import Foundation

struct AuthModel: Codable {

    var deviceType: String?
    var password: String?
    var description: String?
    var locationId: Int?
    var userName: String?
    var accountId: Int?
    var deviceId: String?
    var deviceToken: String?
    var accountType: [String]?
}

struct AuthResponse: Codable {

    var accountId: Int?
    var referenceId: Int?
    var locationId: Int?
    var token: String?
}


struct PatientDataModel: Codable{

    var patientId: Int?
    var patientName: String?
    var umrNo: String?
    var gender: String?
    var age: Int?
    var mobile: String?
    var locationName: String?
}
