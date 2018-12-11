//
//  TableViewController.swift
//  FastLaneTest
//
//  Created by 周彥宏 on 2018/12/11.
//  Copyright © 2018 周彥宏. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet weak var downloadsCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mockify Music"
        
        downloadsCell.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.bool(forKey: "loggedIn") {
            downloadsCell.isHidden = false
        } else {
            downloadsCell.isHidden = true
        }
    }
    
    @IBAction func showLogin(_ sender: Any) {
        
        if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            present(loginVC, animated: true, completion: nil)
        }
    }
}
