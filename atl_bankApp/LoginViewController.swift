//
//  ViewController.swift
//  atl_bankApp
//
//  Created by zed on 13.02.23.
//

import UIKit
import Lottie

class LoginViewController: UIViewController {
    
    var userList: [User] = CrudOperations.readOperation()
    var user: User?
    
    @IBOutlet var animatedLogo: LottieAnimationView!
    
    @IBOutlet var loadingLine: LottieAnimationView!
    
    @IBOutlet var emailInput: UITextField!
    @IBOutlet var passwordInput: UITextField!
    @IBOutlet var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Loading line is hidden
        self.loadingLine.isHidden = true
        
        // Animated Logo
        self.playAnimation()
    }
    
    func playAnimation() {
        self.animatedLogo.contentMode = .scaleAspectFill
        self.animatedLogo.loopMode = .playOnce
        self.animatedLogo.play()
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.show(vc, sender: nil)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        if validateUser() {
            self.messageLabel.text = ""
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            vc.user = self.user
            
            // Loading line
            self.loadingLine.isHidden = false
            self.loadingLine.contentMode = .scaleAspectFill
            self.loadingLine.loopMode = .loop
            self.loadingLine.play()
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                self.navigationController?.show(vc, sender: nil)
                self.loadingLine.isHidden = true
            }
            
        } else {
            self.messageLabel.text = "Please, enter the correct details."
            print("incorrect credentials!")
        }
    }
    
    // Compares entered data with stored one
    func validateUser() -> Bool {
        for userProfile in userList {
            if userProfile.email == self.emailInput.text, userProfile.password == self.passwordInput.text {
                self.user = userProfile
                print("Hello! \(self.user!.email!)")
            }
        }
        
        if self.user?.email != nil,
           self.user?.password != nil,
           !(self.user?.email?.isEmpty ?? false),
           !(self.user?.password?.isEmpty ?? false),
             self.user?.password == self.passwordInput.text,
             self.user?.email == self.emailInput.text
        {
            return true
        } else {
            return false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Resets the labels
        self.messageLabel.text = ""
        self.emailInput.text = ""
        self.passwordInput.text = ""
        
        // Update the userlist array with new data
        self.userList = CrudOperations.readOperation()
        
        // Play the animation again
        self.animatedLogo.play()
    }
    
}

