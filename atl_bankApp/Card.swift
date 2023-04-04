//
//  Card.swift
//  atl_bankApp
//
//  Created by zed on 13.02.23.
//

import Foundation


struct Card: Codable {
    var cardName: String?
    var cardNumber: String?
    var expirationDate: String?
    var cvc: String?
    var balance: Double?
}
