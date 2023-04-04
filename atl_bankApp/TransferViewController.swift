//
//  TransferViewController.swift
//  atl_bankApp
//
//  Created by zed on 24.02.23.
//

import UIKit

class TransferViewController: UIViewController {

    var user: User?
    var userDelegate: UserDelegateProtocol?
    var userList: [User] = [User]()
    
    @IBOutlet var receiverCardNumberInput: UITextField!
    @IBOutlet var amountInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transfer"
    }
    
    
    @IBAction func transferTapped(_ sender: Any) {
        transferMoney()
        navigationController?.popViewController(animated: true)
        //self.backTwo()
    }
    
    func transferMoney() {
        let currentBalance: Double? = self.user?.cardList?[0].balance
        let transferAmount: Double? = Double(self.amountInput.text ?? "0")
        let calcAmount: Double = currentBalance! - transferAmount!
        self.user?.cardList?[0].balance = calcAmount
        
        
        // Adding to file
        self.userList = CrudOperations.readOperation() // setting up the current info to array to avoid the loss
        for (index, user) in userList.enumerated() {
            if user.email == self.user?.email {
                self.userList.remove(at: index)
                self.userList.append(self.user!)
                CrudOperations.writeOperation(userList: self.userList)
            }
        }

        // Sending to delegate
        self.userDelegate?.sendDetails(user: user ?? User())
    }
    
    
    
    
    
    
    // Lifehack from internet
    //    func backTwo() {
    //        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
    //        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    //    }
}
