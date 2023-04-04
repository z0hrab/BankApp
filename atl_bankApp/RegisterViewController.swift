//
//  RegisterViewController.swift
//  atl_bankApp
//
//  Created by zed on 13.02.23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet var fullNameInput: UITextField!
    @IBOutlet var birthDateInput: UITextField!
    @IBOutlet var phoneNumberInput: UITextField!
    @IBOutlet var emailInput: UITextField!
    @IBOutlet var passwordInput: UITextField!
    
    var userList: [User]? = CrudOperations.readOperation()
    
    
    @IBAction func registerTapped(_ sender: Any) {
        register()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func register() {
        // Registering a user
        var user = User()
        user.fullName = self.fullNameInput.text
        user.birthDate = self.birthDateInput.text
        user.phoneNumber = self.phoneNumberInput.text
        user.email = self.emailInput.text
        user.password = self.passwordInput.text
        user.cardList = [Card]()
        
        // Adding to file
        self.userList?.append(user)
        CrudOperations.writeOperation(userList: userList ?? [User]())
        
        self.navigationController?.popViewController(animated: false)
    }
}
