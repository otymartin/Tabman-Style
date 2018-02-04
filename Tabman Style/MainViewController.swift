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
    var xLabel = UILabel()
    var pageLabel = UILabel()
    var viewControllers: [UIViewController] = []

    var xPosition: CGFloat = 0 {
        didSet {
            self.xLabel.text = String(format: "x: %.2f", self.xPosition)
        }
    }
    var currentPage: Int = 0 {
        didSet {
            self.pageLabel.text = String("Page: \(self.currentPage)")
        }
    }
    
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
        self.xPosition = position.x
        
    }
    
    override func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, didScrollToPageAt: index, direction: direction, animated: animated)
        self.tabman.pageboyViewController(pageboyViewController, didScrollToPageAt: index, direction: direction, animated: animated)
        self.currentPage = index
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
        
        self.configureLabels()
    }
    
    private func configureLabels() {
        self.xLabel.configure()
        self.view.addSubview(self.xLabel)
        self.xLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.bottom).offset(-100)
        }
        
        self.pageLabel.configure()
        self.view.addSubview(self.pageLabel)
        self.pageLabel.snp.makeConstraints { [weak self] (make) in
            guard let xLabel = self?.xLabel else { return }
            make.top.equalTo(xLabel.snp.bottom).offset(5)
            make.centerX.equalTo(view.snp.centerX)
        }
    }

}

extension UILabel {
    
    public func configure() {
        self.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        self.textColor = UIColor.black.withAlphaComponent(0.8)
        self.textAlignment = .center
    }
}

extension MainViewController {
    
    fileprivate func configureItems() {
        var items: [TabItem] = []
        for index in 0...4 {
            switch index {
            case 0:
                items.append(TabItem(button: self.tabmanButton(for: .one, with: "One"), position: .offLeft))
            default:
                break
            }
        }
    }
    
    private func tabmanButton(for page: TabPage, with title: String) -> TabmanButton {
        let button = TabmanButton()
        button.page = page
        button.title = title
        return button
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





