//
//  NoCardViewController.swift
//  atl_bankApp
//
//  Created by zed on 15.02.23.
//

import UIKit

class NoCardViewController: UIViewController {

    var userDelegate: UserDelegateProtocol?
    var user: User?
    var userList: [User] = [User]()

    
    @IBOutlet var cardNameInput: UITextField!
    @IBOutlet var cardNumberInput: UITextField!
    @IBOutlet var expireDayInput: UITextField!
    @IBOutlet var cvcInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Card"
    }
    
    @IBAction func createCardTapped(_ sender: Any) {
        self.createCard()
        self.userDelegate?.sendDetails(user: self.user ?? User())
        navigationController?.popViewController(animated: true)
    }
    
    func createCard() {
        var card: Card? = Card()
        card?.cardName = self.cardNameInput.text
        card?.cardNumber = self.cardNumberInput.text
        card?.expirationDate = self.expireDayInput.text
        card?.cvc = self.cvcInput.text
        card?.balance = 1000
        
        self.user?.cardList?.append(card ?? Card())
        
        // Adding to file
        self.userList = CrudOperations.readOperation() // setting up the current info to array to avoid the loss
        for (index, user) in userList.enumerated() {
            if user.email == self.user?.email {
                self.userList.remove(at: index)
                self.userList.append(self.user!)
                CrudOperations.writeOperation(userList: self.userList)
            }
        }
    }
    
}
