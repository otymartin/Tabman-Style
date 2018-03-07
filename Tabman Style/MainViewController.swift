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
    @IBOutlet weak var five: TabmanButton!
    
    var emojiLabel = UILabel()
    
    var xLabel = UILabel()
    var pageLabel = UILabel()
    var viewControllers: [UIViewController] = []
    
    /// PAGE 1 to 0
    var oneLeftToOffRight: Interpolate?
    var oneLeftToOffRightAlpha: Interpolate?
    var twoCenterToCenterRight: Interpolate?
    var twoCenterToCenterRightAlpha: Interpolate?
    var threeRightToFarRight: Interpolate?
    var fourOffRightToFarOffRight: Interpolate?

    /// Page 1 to 2
    var oneLeftToOffLeft: Interpolate?
    var twoCenterToLeft: Interpolate?
    var twoCenterToLeftAlpha: Interpolate?
    var threeRightToCenter: Interpolate?
    var threeRightToCenterAlpha: Interpolate?
    var fourOffRightToRight: Interpolate?
    
    /// Page 2 to 3
    var oneOffLeftToCenterLeft: Interpolate?
    var twoLeftToOffLeft: Interpolate?
    var threeCenterToLeft: Interpolate?
    var threeCenterToLeftAlpha: Interpolate?
    var fourRightToCenter: Interpolate?
    var fourRightToCenterAlpha: Interpolate?

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
        
        let progressTo0 = 1 - (position.x)
        let progressTo2 = position.x - 1
        let progressTo3 = position.x - 2
        
        if progressTo0 >= 0 && position.x <= 1 {
            self.oneLeftToOffRight?.progress = progressTo0
            self.oneLeftToOffRightAlpha?.progress = progressTo0
            self.twoCenterToCenterRight?.progress = progressTo0
            self.twoCenterToCenterRightAlpha?.progress = progressTo0
            self.threeRightToFarRight?.progress = progressTo0
            self.fourOffRightToFarOffRight?.progress = progressTo0
        }
        if progressTo2 >= 0 && position.x >= 1 && position.x <= 2 {
            self.oneLeftToOffLeft?.progress = progressTo2
            self.twoCenterToLeft?.progress = progressTo2
            self.twoCenterToLeftAlpha?.progress = progressTo2
            self.threeRightToCenter?.progress = progressTo2
            self.threeRightToCenterAlpha?.progress = progressTo2
            self.fourOffRightToRight?.progress = progressTo2
        }
        if progressTo3 >= 0 && position.x >= 2 {
            self.oneOffLeftToCenterLeft?.progress = progressTo3
            self.twoLeftToOffLeft?.progress = progressTo3
            self.threeCenterToLeft?.progress = progressTo3
            self.fourRightToCenter?.progress = progressTo3
            self.fourRightToCenterAlpha?.progress = progressTo3
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
        self.configurePage1to0()
        self.configurePage1to2()
        self.configurePage2to3()
    }
    
    fileprivate func configurePage1to0() {
        /// Profile LEFT to OFFRIGHT
        self.oneLeftToOffRight = Interpolate(from: self.one.center.x, to: self.one.offRight, function: BasicInterpolation.linear, apply: { (position) in
            self.one.center.x = position
        })
        self.oneLeftToOffRightAlpha = Interpolate(from: 0.4, to: 1, function: BasicInterpolation.linear, apply: { (alpha) in
            self.one.alpha = alpha
        })
        
        /// People CENTER to CENTERRIGHT
        self.twoCenterToCenterRight = Interpolate(from: self.two.center.x, to: self.two.centerRight, function: BasicInterpolation.linear, apply: { (position) in
            self.two.center.x = position
        })
        self.twoCenterToCenterRightAlpha = Interpolate(from: 1, to: 0.4, apply: { (alpha) in
            self.two.alpha = alpha
        })
        
        /// Standing RIGHT to FARRIGHT
        self.threeRightToFarRight = Interpolate(from: self.three.center.x, to: self.three.farRight, function: BasicInterpolation.linear, apply: { (position) in
            self.three.center.x = position
        })
        
        /// Invite OFFRIGHT to FAROFFRIGHT
        self.fourOffRightToRight = Interpolate(from: self.four.center.x, to: self.four.farOffRight, function: BasicInterpolation.linear, apply: { (position) in
            self.four.center.x = position
        })
    }
    
    fileprivate func configurePage1to2() {
        /// Profile LEFT to OFFLEFT
        self.oneLeftToOffLeft = Interpolate(from: self.one.center.x, to: self.one.offLeft, function: BasicInterpolation.linear, apply: { (position) in
            self.one.center.x = position
        })
        
        /// People CENTER to LEFT
        self.twoCenterToLeft = Interpolate(from: self.two.center.x, to: self.two.left, function: BasicInterpolation.linear, apply: { (position) in
            self.two.center.x = position
        })
        self.twoCenterToLeftAlpha = Interpolate(from: 1, to: 0.4, apply: { (alpha) in
            self.two.alpha = alpha
        })
        
        /// Standing RIGHT to CENTER
        self.threeRightToCenter = Interpolate(from: self.three.center.x, to: self.three.superCenter, function: BasicInterpolation.linear, apply: { (position) in
            self.three.center.x = position
        })
        self.threeRightToCenterAlpha = Interpolate(from: 0.4, to: 1, apply: { (alpha) in
            self.three.alpha = alpha
        })
        
        
        /// Invite OFFRIGHT to RIGHT
        self.fourOffRightToRight = Interpolate(from: self.four.center.x, to: self.four.right, function: BasicInterpolation.linear, apply: { (position) in
            self.four.center.x = position
        })
    }
    
    fileprivate func configurePage2to3() {
        /// Profile OFFLEFT to CENTERLEFT
        self.oneOffLeftToCenterLeft = Interpolate(from: self.one.offLeft, to: self.one.centerLeft, function: BasicInterpolation.linear, apply: { (position) in
            self.one.center.x = position
        })
        
        /// People LEFT to OFFLEFT
        self.twoLeftToOffLeft = Interpolate(from: self.two.left, to: self.two.offLeft, function: BasicInterpolation.linear, apply: { (position) in
            self.two.center.x = position
        })
        
        /// Standing CENTER to LEFT
        self.threeCenterToLeft = Interpolate(from: self.three.superCenter, to: self.three.left, function: BasicInterpolation.linear, apply: { (position) in
            self.three.center.x = position
        })
        self.threeCenterToLeftAlpha = Interpolate(from: 1, to: 0.4, apply: { [weak self] (alpha) in
            self?.three.alpha = alpha
        })
        
        /// Invite RIGHT to CENTER
        self.fourRightToCenter = Interpolate(from: self.four.right, to: self.four.superCenter, function: BasicInterpolation.linear, apply: { (position) in
            self.four.center.x = position
        })
        self.fourRightToCenterAlpha = Interpolate(from: 0.4, to: 1, apply: { [weak self] (alpha) in
            self?.four.alpha = alpha
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

