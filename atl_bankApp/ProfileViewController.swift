//
//  ProfileViewController.swift
//  atl_bankApp
//
//  Created by zed on 24.02.23.
//

import UIKit

class ProfileViewController: UIViewController {

    var user: User?
    
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var cardNameLabel: UILabel!
    @IBOutlet var cardBalanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        self.setUserInfoToLabel()
    }
    
    func setUserInfoToLabel() {
        let userName = self.user?.fullName ?? ""
        let dob = self.user?.birthDate ?? ""
        let userEmail = self.user?.email ?? ""
        //let userNum = self.user?.phoneNumber ?? ""
        let cardName = self.user?.cardList?[0].cardName ?? ""
        let cardBalance = String(self.user?.cardList?[0].balance ?? 0.0)
        
        self.fullNameLabel.text = "Welcome, \(userName)"
        self.dobLabel.text = "Date of Birth: \(dob)"
        self.emailLabel.text = "Email: \(userEmail)"
        self.cardNameLabel.text = "Card Name: \(cardName)"
        self.cardBalanceLabel.text = "Balance: \(cardBalance) AZN"
    }
    

}
