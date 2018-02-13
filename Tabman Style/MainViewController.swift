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
    @IBOutlet weak var four: TabmanButton!
    
    var emojiLabel = UILabel()
    
    var xLabel = UILabel()
    var pageLabel = UILabel()
    var viewControllers: [UIViewController] = []
    
    fileprivate var oneLeftToOffRight: Interpolate?
    fileprivate var oneLeftToOffRightAlpha: Interpolate?
    
    fileprivate var twoCenterToCenterRight: Interpolate?
    fileprivate var twoCenterToCenterRightAlpha: Interpolate?
    
    fileprivate var threeRightToFarRight: Interpolate?
    
    fileprivate var fourOffRightToRight: Interpolate?
    
    fileprivate var oneLeftToOffLeft: Interpolate?
    
    fileprivate var twoCenterToLeft: Interpolate?
    fileprivate var twoCenterToLeftAlpha: Interpolate?
    
    fileprivate var threeRightToCenter:Interpolate?
    fileprivate var threeRightToCenterAlpha: Interpolate?

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
            self.oneLeftToOffRightAlpha?.progress = progress
            self.twoCenterToCenterRight?.progress = progress
            self.twoCenterToCenterRightAlpha?.progress = progress
            self.threeRightToFarRight?.progress = progress
            //self.fourOffRightToRight?.progress = progress
        } else {
            self.oneLeftToOffLeft?.progress = completion
            self.twoCenterToLeftAlpha?.progress = completion
            self.twoCenterToLeft?.progress = completion
            self.threeRightToCenter?.progress = completion
            self.threeRightToCenterAlpha?.progress = completion
            self.fourOffRightToRight?.progress = completion
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
        self.four.page = .four
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
    
    public func configureInterpolations() {
        self.configureOneLeftToOffRight()
        self.configureTwoCenterToSuperCenter()
        self.configureThreeRightToFarRight()
        self.configureFourOffRightToRight()
        
        self.configureOneLeftToOffLeft()
        self.configureTwoCenterToLeft()
        self.configureThreeRightToCenter()
    }
    
    fileprivate func configureOneLeftToOffRight() {
        self.oneLeftToOffRight = Interpolate(from: self.one.center.x, to: self.one.offRight, function: BasicInterpolation.linear, apply: { (position) in
            self.one.center.x = position
        })
        self.oneLeftToOffRightAlpha = Interpolate(from: 0.4, to: 1, function: BasicInterpolation.linear, apply: { (alpha) in
            self.one.alpha = alpha
        })
    }
    
    fileprivate func configureTwoCenterToSuperCenter() {
        self.twoCenterToCenterRight = Interpolate(from: self.two.center.x, to: self.two.centerRight, function: BasicInterpolation.linear, apply: { (position) in
            self.two.center.x = position
        })
        self.twoCenterToCenterRightAlpha = Interpolate(from: 1, to: 0.4, apply: { (alpha) in
            self.two.alpha = alpha
        })
    }
    
    fileprivate func configureThreeRightToFarRight() {
        self.threeRightToFarRight = Interpolate(from: self.three.center.x, to: self.three.farRight, function: BasicInterpolation.linear, apply: { (position) in
            self.three.center.x = position
        })
    }
    
    fileprivate func configureFourOffRightToRight() {
        self.fourOffRightToRight = Interpolate(from: self.four.center.x, to: self.four.right, function: BasicInterpolation.linear, apply: { (position) in
            self.four.center.x = position
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
        self.twoCenterToLeftAlpha = Interpolate(from: 1, to: 0.4, apply: { (alpha) in
            self.two.alpha = alpha
        })
    }
    
    fileprivate func configureThreeRightToCenter() {
        self.threeRightToCenter = Interpolate(from: self.three.center.x, to: self.three.superCenter, function: BasicInterpolation.linear, apply: { (position) in
            self.three.center.x = position
        })
        self.threeRightToCenterAlpha = Interpolate(from: 0.4, to: 1, apply: { (alpha) in
            self.three.alpha = alpha
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

