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
import Interpolate

public class MainViewController: TabmanViewController {
    
    var tabman: Tabman!
    var xLabel = UILabel()
    var pageLabel = UILabel()
    var viewControllers: [UIViewController] = []
    
    fileprivate var oneLeftToCenter: Interpolate?
    fileprivate var twoCenterToRight: Interpolate?
    fileprivate var threeRightToOffRight: Interpolate?
    
    fileprivate var oneLeftToOffLeft: Interpolate?
    fileprivate var twoCenterToLeft: Interpolate?
    fileprivate var threeRightToCenter:Interpolate?

    var xPosition: CGFloat = 0 {
        didSet {
            self.xLabel.text = String(format: "x: %.2f", self.xPosition)
        }
    }
    var currentPage: Int? {
        didSet {
            self.pageLabel.text = String("page: \(self.currentPage ?? 0)")
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.configureViewControllers()
        self.configureUI()
        self.dataSource = self
    }
    
    override public func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, willScrollToPageAt: index, direction: direction, animated: animated)
    }
    
    override public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, didScrollTo: position, direction: direction, animated: animated)
        self.xPosition = position.x
        
        guard let currentPage = self.currentPage, position.x >= 0 && position.x <= 2 else { return }
        
        var progress = 1 - (position.x)
        if currentPage == 1 && direction == .reverse || currentPage == 0 && direction == .forward {
            self.oneLeftToCenter?.progress = progress
            self.twoCenterToRight?.progress = progress
            self.threeRightToOffRight?.progress = progress
        }
        
        progress = position.x - 1
        if currentPage == 1 && direction == .forward || currentPage == 2 && direction == .reverse {
            self.oneLeftToOffLeft?.progress = progress
            self.twoCenterToLeft?.progress = progress
            self.threeRightToCenter?.progress = progress
            
        }
    }
    
    override public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, didScrollToPageAt: index, direction: direction, animated: animated)
        self.currentPage = index
        
        guard let position = self.currentPosition, let currentPage = self.currentPage, position.x >= 0 && position.x <= 2 else { return }
        
        var progress = 1 - (position.x)
        if currentPage == 1 && direction == .reverse || currentPage == 0 && direction == .forward {
            self.oneLeftToCenter?.progress = progress
            self.twoCenterToRight?.progress = progress
            self.threeRightToOffRight?.progress = progress
        }
        
        progress = position.x - 1
        if currentPage == 1 && direction == .forward || currentPage == 2 && direction == .reverse {
            self.oneLeftToOffLeft?.progress = progress
            self.twoCenterToLeft?.progress = progress
            self.threeRightToCenter?.progress = progress
            
        }
    }
}

extension MainViewController {
    
    func configureUI() {
        self.tabman = Tabman()
        self.tabman.delegate = self
        self.view.addSubview(self.tabman)
        self.tabman.snp.makeConstraints({ [weak self] (make) in
            guard let topLayoutGuide = self?.topLayoutGuide else { return }
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(44)
        })
        self.tabman.setNeedsLayout()
        self.tabman.layoutIfNeeded()
        self.configureLabels()
        self.configureInterpolations()
        self.tabman.one.button.alpha = 0.4
        self.tabman.two.button.alpha = 1
        self.tabman.three.button.alpha = 0.4
    }
    
    private func configureLabels() {
        self.xLabel.configure()
        self.view.addSubview(self.xLabel)
        self.xLabel.snp.makeConstraints { (make) in
            make.center.equalTo(view.snp.center)
        }
        self.xPosition = 0.0
        
        self.pageLabel.configure()
        self.view.addSubview(self.pageLabel)
        self.pageLabel.snp.makeConstraints { [weak self] (make) in
            guard let xLabel = self?.xLabel else { return }
            make.top.equalTo(xLabel.snp.bottom).offset(5)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    fileprivate func tabmanButton(for page: TabPage) -> TabmanButton {
        let button = TabmanButton()
        button.configure(for: page)
        return button
    }
}

extension MainViewController {
    
    fileprivate func configureInterpolations() {
        self.configureOneLeftToCenter()
        self.configureTwoCenterToRight()
        self.configureThreeRightToOffRight()
        self.configureOneLeftToOffLeft()
        self.configureTwoCenterToLeft()
        self.configureThreeRightToCenter()
    }
    
    fileprivate func configureOneLeftToCenter() {
        self.oneLeftToCenter = Interpolate(from: self.tabman.one.button.center.x, to: self.tabman.one.offRight, function:  BasicInterpolation.linear , apply: { (position) in
            self.tabman.one.button.center.x = position
        })
    }
    
    fileprivate func configureTwoCenterToRight() {
        self.twoCenterToRight = Interpolate(from: self.tabman.two.button.center.x, to: self.tabman.two.centerRight, function:  BasicInterpolation.linear, apply: { (position) in
            self.tabman.two.button.center.x = position
        })
    }
    
    fileprivate func configureThreeRightToOffRight() {
        self.threeRightToOffRight = Interpolate(from: self.tabman.three.button.center.x, to: self.tabman.three.farRight, function:  BasicInterpolation.linear, apply: { (position) in
            self.tabman.three.button.center.x = position
        })
    }
    
    fileprivate func configureOneLeftToOffLeft() {
        self.oneLeftToOffLeft = Interpolate(from: self.tabman.one.button.center.x, to: self.tabman.one.offLeft, function:  BasicInterpolation.linear , apply: { (position) in
            self.tabman.one.button.center.x = position
        })
    }
    
    fileprivate func configureTwoCenterToLeft() {
        self.twoCenterToLeft = Interpolate(from: self.tabman.two.button.center.x, to: self.tabman.two.left, function:  BasicInterpolation.linear, apply: { (position) in
            self.tabman.two.button.center.x = position
        })
    }
    
    fileprivate func configureThreeRightToCenter() {
        self.threeRightToCenter = Interpolate(from: self.tabman.three.button.center.x, to: self.tabman.three.center, function:  BasicInterpolation.linear, apply: { (position) in
            self.tabman.three.button.center.x = position
        })
    }
    
}


extension UILabel {
    
    public func configure() {
        self.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        self.textColor = UIColor.black.withAlphaComponent(0.8)
        self.textAlignment = .center
    }
}

extension MainViewController: PageboyViewControllerDataSource {
    
    func configureViewControllers() {
        for page in iterateEnum(TabPage.self) {
            let pageViewController = PageViewController()
            pageViewController.page = page
            self.viewControllers.append(pageViewController)
        }
    }
    
    public func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return self.viewControllers.count
    }
    
    public func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return self.viewControllers[index]
    }
    
    public func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return Page.at(index: 1)
    }
}

