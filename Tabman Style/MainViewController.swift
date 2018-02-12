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
    
    
    @IBOutlet weak var tabman: UIView!
    @IBOutlet weak var one: TabmanButton!
    @IBOutlet weak var two: TabmanButton!
    @IBOutlet weak var three: TabmanButton!
    
    var xLabel = UILabel()
    var pageLabel = UILabel()
    var viewControllers: [UIViewController] = []
    
    fileprivate var oneLeftToOffRight: Interpolate?
    fileprivate var twoCenterToCenterRight: Interpolate?
    fileprivate var threeRightToFarRight: Interpolate?
    
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
        
        let progress = 1 - (position.x)
        let completion = position.x - 1
        
        if progress >= 0 {
            self.oneLeftToOffRight?.progress = progress
            self.twoCenterToCenterRight?.progress = progress
            self.threeRightToFarRight?.progress = progress
        } else {
            self.oneLeftToOffLeft?.progress = completion
            self.twoCenterToLeft?.progress = completion
            self.threeRightToCenter?.progress = completion
        }
        
    
    }
    
    override public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, didScrollToPageAt: index, direction: direction, animated: animated)
        self.currentPage = index
    }
}

extension MainViewController {
    
    func configureUI() {
        self.configureLabels()
        self.configureInterpolations()
        self.one.page = .one
        self.two.page = .two
        self.three.page = .three
        self.one.alpha = 0.4
        self.two.alpha = 1
        self.three.alpha = 0.4
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
}

extension MainViewController {
    
    fileprivate func configureInterpolations() {
        self.configureOneLeftToOffRight()
        self.configureTwoCenterToSuperCenter()
        self.configureThreeRightToFarRight()
        
        self.configureOneLeftToOffLeft()
        self.configureTwoCenterToLeft()
        self.configureThreeRightToCenter()
    }
    
    fileprivate func configureOneLeftToOffRight() {
        
        self.oneLeftToOffRight = Interpolate(from: self.one.center.x, to: self.one.offRight, function: BasicInterpolation.linear, apply: { (position) in
            self.one.center.x = position
        })
    }
    
    fileprivate func configureTwoCenterToSuperCenter() {
        self.twoCenterToCenterRight = Interpolate(from: self.two.center.x, to: self.two.centerRight, function: BasicInterpolation.linear, apply: { (position) in
            self.two.center.x = position
        })
    }
    
    fileprivate func configureThreeRightToFarRight() {
        self.threeRightToFarRight = Interpolate(from: self.three.center.x, to: self.three.farRight, function: BasicInterpolation.linear, apply: { (position) in
            self.three.center.x = position
        })
    }
    
    fileprivate func configureOneLeftToOffLeft() {
        self.oneLeftToOffLeft = Interpolate(from: self.one.center.x, to: self.one.offLeft, function: BasicInterpolation.linear, apply: { (position) in
            self.one.center.x = position
        })
    }
    
    fileprivate func configureTwoCenterToLeft() {
        self.twoCenterToLeft = Interpolate(from: self.two.center.x, to: self.two.left, function: BasicInterpolation.linear, apply: { (position) in
            self.two.center.x = position
        })
    }
    
    fileprivate func configureThreeRightToCenter() {
        self.threeRightToCenter = Interpolate(from: self.three.center.x, to: self.three.superCenter, function: BasicInterpolation.linear, apply: { (position) in
            self.three.center.x = position
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

