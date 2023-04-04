//
//  CardExistsViewController.swift
//  atl_bankApp
//
//  Created by zed on 24.02.23.
//

import UIKit

class CardExistsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UserDelegateProtocol {

    var timeToPassUserToHome: Bool = false
    var user: User?
    var userDelegateHome: UserDelegateHomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if timeToPassUserToHome {
            self.userDelegateHome?.sendDetailsToHome(user: user ?? User())
        }
    }
    
    // Delegate method from transfer to cardexists
    func sendDetails(user: User) {
        self.timeToPassUserToHome = true
        self.user = user
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.user?.cardList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell")!
        cell.textLabel?.text = user?.cardList?[indexPath.row].cardName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TransferViewController") as! TransferViewController
        vc.user = self.user
        vc.userDelegate = self
        navigationController?.show(vc, sender: nil)
    }
    
    
}
