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

open class BaseMainViewController: TabmanViewController {
    
    @IBOutlet weak var tabman: UIView!
    
    private lazy var one = TabButton()
    
    private lazy var two = TabButton()
    
    private lazy var three = TabButton()
    
    private lazy var four = TabButton()
    
    private lazy var five = TabButton()
    
    private var viewControllers: [UIViewController] = []
    
    /// PAGE 1 to 0
    private var oneLeftToOffRight: Interpolate?
    
    private var oneLeftToOffRightAlpha: Interpolate?
    
    private var twoCenterToCenterRight: Interpolate?
    
    private var twoCenterToCenterRightAlpha: Interpolate?
    
    private var threeRightToFarRight: Interpolate?
    
    private var fourOffRightToFarOffRight: Interpolate?
    
    private var fiveCenterRightToFarRight: Interpolate?

    /// Page 1 to 2
    private var oneLeftToOffLeft: Interpolate?
    private var twoCenterToLeft: Interpolate?
    private var twoCenterToLeftAlpha: Interpolate?
    private var threeRightToCenter: Interpolate?
    private var threeRightToCenterAlpha: Interpolate?
    private var fourOffRightToRight: Interpolate?
    private var fiveCenterRightToOffRight: Interpolate?
    
    /// Page 2 to 3
    private var oneOffLeftToCenterLeft: Interpolate?
    private var twoLeftToOffLeft: Interpolate?
    private var threeCenterToLeft: Interpolate?
    private var threeCenterToLeftAlpha: Interpolate?
    private var fourRightToCenter: Interpolate?
    private var fourRightToCenterAlpha: Interpolate?
    private var fiveOffRightToRight: Interpolate?
    
    
    /// Page 3 to 4
    private var oneCenterleftToFarLeft: Interpolate?
    private var twoOffLeftToCenterLeft: Interpolate?
    private var threeLeftToOffLeft: Interpolate?
    private var fourCenterToLeft: Interpolate?
    private var fourCenterToLeftAlpha: Interpolate?
    private var fiveRightToCenter: Interpolate?
    private var fiveRightToCenterAlpha: Interpolate?

    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.loadViewControllers()
        self.configure()
        self.dataSource = self
    }
    
    override open func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, willScrollToPageAt: index, direction: direction, animated: animated)
    }
    
    override open func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, didScrollTo: position, direction: direction, animated: animated)
        
        let progressTo0 = 1 - (position.x)
        let progressTo2 = position.x - 1
        let progressTo3 = position.x - 2
        let progressTo4 = position.x - 3
        
        if progressTo0 >= 0 && position.x <= 1 {
            self.oneLeftToOffRight?.progress = progressTo0
            self.oneLeftToOffRightAlpha?.progress = progressTo0
            self.twoCenterToCenterRight?.progress = progressTo0
            self.twoCenterToCenterRightAlpha?.progress = progressTo0
            self.threeRightToFarRight?.progress = progressTo0
            self.fourOffRightToFarOffRight?.progress = progressTo0
            self.fiveCenterRightToFarRight?.progress = progressTo0
        }
        if progressTo2 >= 0 && position.x >= 1 && position.x <= 2 {
            self.oneLeftToOffLeft?.progress = progressTo2
            self.twoCenterToLeft?.progress = progressTo2
            self.twoCenterToLeftAlpha?.progress = progressTo2
            self.threeRightToCenter?.progress = progressTo2
            self.threeRightToCenterAlpha?.progress = progressTo2
            self.fourOffRightToRight?.progress = progressTo2
            self.fiveCenterRightToOffRight?.progress = progressTo2
        }
        if progressTo3 >= 0 && position.x >= 2 && position.x <= 3 {
            self.oneOffLeftToCenterLeft?.progress = progressTo3
            self.twoLeftToOffLeft?.progress = progressTo3
            self.threeCenterToLeft?.progress = progressTo3
            self.fourRightToCenter?.progress = progressTo3
            self.fourRightToCenterAlpha?.progress = progressTo3
            self.fiveOffRightToRight?.progress = progressTo3
        }
        if progressTo4 >= 0 && position.x >= 3 {
            self.oneCenterleftToFarLeft?.progress = progressTo4
            self.twoOffLeftToCenterLeft?.progress = progressTo4
            self.threeLeftToOffLeft?.progress = progressTo4
            self.fourCenterToLeft?.progress = progressTo4
            self.fourCenterToLeftAlpha?.progress = progressTo4
            self.fiveRightToCenter?.progress = progressTo4
            self.fiveRightToCenterAlpha?.progress = progressTo4
        }
    }
    
    override open func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, didScrollToPageAt: index, direction: direction, animated: animated)
    }
}

extension BaseMainViewController {
    
    func configure() {
        self.addButtons()
    }
    
    private func addButtons() {
        let buttons = [self.one, self.two, self.three, self.four, self.five]
        let pages: [TabPage] = [.one, .two, .three, .four, .five]
        for (index, button) in buttons.enumerated() {
            button.page = pages[index]
            button.alpha = button.page.startingAlpha
            button.setTitle(button.page.title, for: .normal)
            self.tabman.addSubview(button)
            button.sizeToFit()
            button.center.x = button.centerX
            button.center.y = button.centerY
        }
        self.configureInterpolations()
    }

    
}

extension BaseMainViewController {
    
    public func configureInterpolations() {
        self.configurePage1to0()
        self.configurePage1to2()
        self.configurePage2to3()
        self.configurePage3To4()
    }
    
    private func configurePage1to0() {
        
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
        
        /// Fans RIGHT to FARRIGHT
        self.threeRightToFarRight = Interpolate(from: self.three.center.x, to: self.three.farRight, function: BasicInterpolation.linear, apply: { (position) in
            self.three.center.x = position
        })
        
        /// Standing OFFRIGHT to FAROFFRIGHT
        self.fourOffRightToRight = Interpolate(from: self.four.center.x, to: self.four.farOffRight, function: BasicInterpolation.linear, apply: { (position) in
            self.four.center.x = position
        })
        
        /// Invite CENTERRIGHT to FARRIGHT
        self.fiveCenterRightToOffRight = Interpolate(from: self.five.center.x, to: self.five.farRight, apply: { [weak self] (position) in
            self?.five.center.x = position
        })
        
    }
    
    fileprivate func configurePage1to2() {
        /// Profile LEFT to OFFLEFT
        self.oneLeftToOffLeft = Interpolate(from: self.one.center.x, to: self.one.offLeft, function: BasicInterpolation.linear, apply: { (position) in
            self.one.center.x = position
        })
        
        /// People CENTER to LEFT
        self.twoCenterToLeft = Interpolate(from: self.two.center.x, to: self.two.lhs, function: BasicInterpolation.linear, apply: { (position) in
            self.two.center.x = position
        })
        self.twoCenterToLeftAlpha = Interpolate(from: 1, to: 0.4, apply: { (alpha) in
            self.two.alpha = alpha
        })
        
        /// Fans RIGHT to CENTER
        self.threeRightToCenter = Interpolate(from: self.three.center.x, to: self.three.tabCenter, function: BasicInterpolation.linear, apply: { (position) in
            self.three.center.x = position
        })
        self.threeRightToCenterAlpha = Interpolate(from: 0.4, to: 1, apply: { (alpha) in
            self.three.alpha = alpha
        })
        
        /// Standing OFFRIGHT to RIGHT
        self.fourOffRightToRight = Interpolate(from: self.four.center.x, to: self.four.rhs, function: BasicInterpolation.linear, apply: { (position) in
            self.four.center.x = position
        })
        
        /// Invite CENTERRIGHT to OFFRIGHT
        self.fiveCenterRightToOffRight = Interpolate(from: self.five.center.x, to: self.five.offRight, apply: { [weak self] (position) in
            self?.five.center.x = position
        })
    }
    
    fileprivate func configurePage2to3() {
        /// Profile OFFLEFT to CENTERLEFT
        self.oneOffLeftToCenterLeft = Interpolate(from: self.one.offLeft, to: self.one.centerLeft, function: BasicInterpolation.linear, apply: { (position) in
            self.one.center.x = position
        })
        
        /// People LEFT to OFFLEFT
        self.twoLeftToOffLeft = Interpolate(from: self.two.lhs, to: self.two.offLeft, function: BasicInterpolation.linear, apply: { (position) in
            self.two.center.x = position
        })
        
        /// Fans CENTER to LEFT
        self.threeCenterToLeft = Interpolate(from: self.three.tabCenter, to: self.three.lhs, function: BasicInterpolation.linear, apply: { (position) in
            self.three.center.x = position
        })
        self.threeCenterToLeftAlpha = Interpolate(from: 1, to: 0.4, apply: { [weak self] (alpha) in
            self?.three.alpha = alpha
        })
        
        /// Standing RIGHT to CENTER
        self.fourRightToCenter = Interpolate(from: self.four.rhs, to: self.four.tabCenter, function: BasicInterpolation.linear, apply: { (position) in
            self.four.center.x = position
        })
        self.fourRightToCenterAlpha = Interpolate(from: 0.4, to: 1, apply: { [weak self] (alpha) in
            self?.four.alpha = alpha
        })
        
        /// Invite OFFRight to RIGHT
        self.fiveOffRightToRight = Interpolate(from: self.five.center.x, to: self.five.rhs, apply: { [weak self] (position) in
            self?.five.center.x = position
        })
        
    }
    
    fileprivate func configurePage3To4() {
        
        /// Profile CENTERLEFT to FARLEFT
        self.oneCenterleftToFarLeft = Interpolate(from: self.one.centerLeft, to: self.one.farLeft, apply: {  [weak self] (position) in
            self?.one.center.x = position
        })
        
        /// People OFFLEFT to CENTERLEFT
        self.twoOffLeftToCenterLeft = Interpolate(from: self.two.offLeft, to: self.two.centerLeft, apply: { [weak self] (position) in
            self?.two.center.x = position
        })
        
        /// Fans LEFT to OFFLeft
        self.threeLeftToOffLeft = Interpolate(from: self.three.lhs, to: self.three.offLeft, apply: { [weak self] (position) in
            self?.three.center.x = position
        })
        
        /// Standing CENTER to LEFT
        self.fourCenterToLeft = Interpolate(from: self.four.tabCenter, to: self.four.lhs, apply: { [weak self] (position) in
            self?.four.center.x = position
        })
        
        self.fourCenterToLeftAlpha = Interpolate(from: 1, to: 0.4, apply: { [weak self] (alpha) in
            self?.four.alpha = alpha
        })
        
        /// Invite RIGHT to CENTER
        self.fiveRightToCenter = Interpolate(from: self.five.rhs, to: self.five.tabCenter, apply: { [weak self] (position) in
            self?.five.center.x = position
        })
        
        self.fiveRightToCenterAlpha = Interpolate(from: 0.4, to: 1, apply: { [weak self] (alpha) in
            self?.five.alpha = alpha
        })
        
        
    }
}

public func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
    var i = 0
    return AnyIterator {
        let next = withUnsafeBytes(of: &i) { $0.load(as: T.self) }
        if next.hashValue != i { return nil }
        i += 1
        return next
    }
}

extension BaseMainViewController: PageboyViewControllerDataSource {
    
    func loadViewControllers() {
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

