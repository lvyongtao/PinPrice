//
//  IndexViewController.swift
//  PinPrice
//
//  Created by lvyongtao on 16/11/2.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

import UIKit

class IndexViewController: RootViewController {

    var indexTableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        
        let login = LoginViewController()
        
        self.navigationController?.pushViewController(login, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
