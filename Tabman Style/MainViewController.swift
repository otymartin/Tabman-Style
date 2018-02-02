//
//  ViewController.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-02.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class MainViewController: TabmanViewController {
    
    var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadViewControllers()
        self.dataSource = self
    }
    
}

extension MainViewController: PageboyViewControllerDataSource {
    
    func loadViewControllers() {
        
        for index in 0...4 {
            let viewController = UIViewController()
            switch index {
            case 0:
                viewController.title = "One"
                viewController.view.backgroundColor = .red
            case 1:
                viewController.title = "Two"
                viewController.view.backgroundColor = .blue
            case 2:
                viewController.title = "Three"
                viewController.view.backgroundColor = .cyan
            case 3:
                viewController.title = "Four"
                viewController.view.backgroundColor = .yellow
            case 4:
                viewController.title = "Five"
                viewController.view.backgroundColor = .purple
            default:
                break
            }
            self.viewControllers.append(viewController)
        }
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        self.bar.items = self.viewControllers.map { Item(title: $0.title ?? "") }
        return self.viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return self.viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return Page.at(index: 2)
    }
    
    
}
