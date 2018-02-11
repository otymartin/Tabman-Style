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
    fileprivate var oneCenterToRight: Interpolate?
    fileprivate var oneRightToOffRight: Interpolate?
    
    fileprivate var twoCenterToRight: Interpolate?
    fileprivate var twoRightToOffRight: Interpolate?
    
    fileprivate var threeToOffRight: Interpolate?

    var xPosition: CGFloat = 0 {
        didSet {
            self.xLabel.text = String(format: "x: %.2f", self.xPosition)
        }
    }
    var currentPage: Int = 0 {
        didSet {
            self.pageLabel.text = String("page: \(self.currentPage)")
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
        
        let progress = 1 - (position.x)
        self.oneLeftToCenter?.progress = progress
        self.twoCenterToRight?.progress = progress
        self.threeToOffRight?.progress = progress
    }
    
    override public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, didScrollToPageAt: index, direction: direction, animated: animated)
        self.currentPage = index
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
        self.view.backgroundColor = .green
        self.configureInterpolations()

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
    }
    
    fileprivate func configureOneLeftToCenter(with direction: PageboyViewController.NavigationDirection? = nil) {
        self.oneLeftToCenter = Interpolate(from: self.tabman.one.button.center.x, to: self.tabman.one.center, function: BasicInterpolation.easeOut, apply: { [weak self] (newPosition) in
            self?.tabman.one.button.center.x = newPosition
        })
    }
    
    fileprivate func configureTwoCenterToRight(with direction: PageboyViewController.NavigationDirection? = nil) {
        self.twoCenterToRight = Interpolate(from: self.tabman.two.button.center.x, to: self.tabman.two.right, function: BasicInterpolation.easeOut, apply: { [weak self] (newPosition) in
            self?.tabman.two.button.center.x = newPosition
        })
    }
    
    fileprivate func configureThreeToOffright(with direction: PageboyViewController.NavigationDirection? = nil) {
        self.threeToOffRight = Interpolate(from: self.tabman.three.button.center.x, to: self.tabman.three.offRight, function: BasicInterpolation.easeOut, apply: { [weak self] (newPosition) in
            self?.tabman.three.button.center.x = newPosition
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



