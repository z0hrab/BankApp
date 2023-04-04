//
//  User.swift
//  atl_bankApp
//
//  Created by zed on 13.02.23.
//

import Foundation


struct User: Codable {
    var fullName: String?
    var birthDate: String?
    var phoneNumber: String?
    var email: String?
    var password: String?
    var cardList: [Card]?
}
