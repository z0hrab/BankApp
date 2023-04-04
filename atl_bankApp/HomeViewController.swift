//
//  HomeViewController.swift
//  atl_bankApp
//
//  Created by zed on 15.02.23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UserDelegateProtocol, UserDelegateHomeProtocol {

    var user: User?
    var homeMenu: [String] = ["Cards", "Transfer", "Profile"]
    
    @IBOutlet var table: UITableView!
        

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome"
    }
    
    func sendDetailsToHome(user: User) {
        self.user = user
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        // Animation the cell load
        cell.alpha = 0
        UIView.animate(withDuration: 1, delay: TimeInterval(indexPath.item)) {
            cell.alpha = 1
        }
        
        cell.textLabel?.text = "\(homeMenu[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            runCards()
        } else if indexPath.row == 2 {
            showProfile()
        } else if indexPath.row == 1 {
            goTransfer()
        }
    }
    
    func sendDetails(user: User) {
        self.user = user
    }
    
    func goTransfer() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TransferViewController") as! TransferViewController
        vc.user = self.user
        vc.userDelegate = self
        navigationController?.show(vc, sender: nil)
    }
    
    func showProfile() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.user = self.user
        navigationController?.show(vc, sender: nil)
        
    }
    
    func runCards() {
        if self.user?.cardList != nil, !(user?.cardList?.isEmpty ?? true) {
            // show cards method
            let vc = storyboard?.instantiateViewController(withIdentifier: "CardExistsViewController") as! CardExistsViewController
            vc.user = self.user
            vc.userDelegateHome = self // for home
            navigationController?.show(vc, sender: nil)
            // print("kartlar var")
        } else {
            // creating new card
            let vc = storyboard?.instantiateViewController(withIdentifier: "NoCardViewController") as! NoCardViewController
            vc.user = self.user
            vc.userDelegate = self
            navigationController?.show(vc, sender: nil)
        }
    }
    
    
}
