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
import SnapKit

class MainViewController: TabmanViewController {
    
    var tabman = Tabman()
    
    var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadViewControllers()
        self.configureUI()
        self.dataSource = self
    }
    
    override func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, willScrollToPageAt: index, direction: direction, animated: animated)
        self.tabman.pageboyViewController(pageboyViewController, willScrollToPageAt: index, direction: direction, animated: animated)
    }
    
    override func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, didScrollTo: position, direction: direction, animated: animated)
        self.tabman.pageboyViewController(pageboyViewController, didScrollTo: position, direction: direction, animated: animated)
    }
    
    override func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, didScrollToPageAt: index, direction: direction, animated: animated)
        self.tabman.pageboyViewController(pageboyViewController, didScrollToPageAt: index, direction: direction, animated: animated)
    }
}

extension MainViewController {
    
    func configureUI() {
        self.view.addSubview(self.tabman)
        self.tabman.snp.makeConstraints({ [weak self] (make) in
            guard let topLayoutGuide = self?.topLayoutGuide else { return }
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(44)
        })
        self.tabman.set(self.viewControllers.map { $0.title ?? "Title" })
    }
}

private func configureItems() {
    for index in 0...4 {
        
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
        return self.viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return self.viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return Page.at(index: 2)
    }
}





