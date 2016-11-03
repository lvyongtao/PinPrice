
//
//  TabBarViewController.swift
//  PinPrice
//
//  Created by lvyongtao on 16/10/24.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.view.backgroundColor = UIColor.white
        
        let index = IndexViewController()
        index.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarSystemItem.bookmarks, tag: 0)
        let indexNav = UINavigationController.init(rootViewController: index)
        
        let assertment = AssertmentViewController()
        assertment.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarSystemItem.recents, tag: 1)

        let assertmentNav = UINavigationController.init(rootViewController: assertment)
        
        let shop = ShoppingCartViewController()
        shop.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarSystemItem.downloads, tag: 1)

        let shopNav = UINavigationController.init(rootViewController: shop)
        
        let mine = MineViewController()
        mine.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarSystemItem.favorites, tag: 1)

        let mineNav = UINavigationController.init(rootViewController: mine)
        
        self.addChildViewController(indexNav)
        self.addChildViewController(assertmentNav)
        self.addChildViewController(shopNav)
        self.addChildViewController(mineNav)
        
        
        
        
        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
