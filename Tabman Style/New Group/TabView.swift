//
//  Tabman.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-02.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit
import Pageboy
import SnapKit
import Interpolate

protocol TabViewDelegate: class {
    
    func didTapTab(for page: TabPage)
}

final class TabView: UIView {
  
    private lazy var one = TabButton()
    
    private lazy var two = TabButton()
    
    private lazy var three = TabButton()
    
    private lazy var four = TabButton()
    
    private lazy var five = TabButton()
        
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
    
    public weak var delegate: TabViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
}

extension TabView: TabButtonDelegate {
    
    internal func didTapTabButton(for page: TabPage) {
        self.delegate?.didTapTab(for: page)
    }
}

extension TabView {
    
    private func configure() {
        self.addButtons()
        self.backgroundColor = .yellow
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 44)
    }
    
    private func addButtons() {
        let buttons = [self.one, self.two, self.three, self.four, self.five]
        let pages: [TabPage] = [.one, .two, .three, .four, .five]
        for (index, button) in buttons.enumerated() {
            let page = pages[index]
            button.page = page
            button.delegate = self
            button.setTitleColor(page.startingColor, for: .normal)
            button.setTitle(page.title, for: .normal)
            self.addSubview(button)
            button.sizeToFit()
            button.center.x = button.centerX
            button.center.y = button.centerY
        }
        self.configureInterpolations()
    }
    
    
    private func configureInterpolations() {
        self.configurePage1to0()
        self.configurePage1to2()
        self.configurePage2to3()
        self.configurePage3To4()
    }
    
    private func configurePage1to0() {
        
        /// ONE LEFT to OFFRIGHT
        self.oneLeftToOffRight = Interpolate(from: self.one.center.x, to: self.one.offRight, function: BasicInterpolation.linear, apply: { [weak self] (position) in
            self?.one.center.x = position
        })
        self.oneLeftToOffRightAlpha = Interpolate(from: self.one.page.faded, to: self.one.page.visible, function: BasicInterpolation.linear, apply: { [weak self] (color) in
            //self.one.titleLabel?.textColor = color
            self?.one.setTitleColor(color, for: .normal)
        })
        
        /// TWO CENTER to CENTERRIGHT
        self.twoCenterToCenterRight = Interpolate(from: self.two.center.x, to: self.two.centerRight, function: BasicInterpolation.linear, apply: { [weak self] (position) in
            self?.two.center.x = position
        })
        self.twoCenterToCenterRightAlpha = Interpolate(from: self.two.page.visible, to: self.two.page.faded, apply: { [weak self] (color) in
            // self.two.titleLabel?.textColor = color
            self?.two.setTitleColor(color, for: .normal)
        })
        
        /// THREE RIGHT to FARRIGHT
        self.threeRightToFarRight = Interpolate(from: self.three.center.x, to: self.three.farRight, function: BasicInterpolation.linear, apply: { [weak self] (position) in
            self?.three.center.x = position
        })
        
        /// FOUR OFFRIGHT to FAROFFRIGHT
        self.fourOffRightToRight = Interpolate(from: self.four.center.x, to: self.four.farOffRight, function: BasicInterpolation.linear, apply: { [weak self] (position) in
            self?.four.center.x = position
        })
        
        /// FIVE CENTERRIGHT to FARRIGHT
        self.fiveCenterRightToOffRight = Interpolate(from: self.five.center.x, to: self.five.farRight, apply: { [weak self] (position) in
            self?.five.center.x = position
        })
        
    }
    
    private func configurePage1to2() {
        
        /// ONE LEFT to OFFLEFT
        self.oneLeftToOffLeft = Interpolate(from: self.one.center.x, to: self.one.offLeft, function: BasicInterpolation.linear, apply: { [weak self] (position) in
            self?.one.center.x = position
        })
        
        /// TWO CENTER to LEFT
        self.twoCenterToLeft = Interpolate(from: self.two.center.x, to: self.two.lhs, function: BasicInterpolation.linear, apply: { [weak self] (position) in
            self?.two.center.x = position
        })
        self.twoCenterToLeftAlpha = Interpolate(from: self.two.page.visible, to: self.two.page.faded, apply: { [weak self] (color) in
            self?.two.setTitleColor(color, for: .normal)
        })
        
        /// THREE RIGHT to CENTER
        self.threeRightToCenter = Interpolate(from: self.three.center.x, to: self.three.tabCenter, function: BasicInterpolation.linear, apply: { [weak self] (position) in
            self?.three.center.x = position
        })
        self.threeRightToCenterAlpha = Interpolate(from: self.three.page.hidden, to: self.three.page.visible, apply: { [weak self] (color) in
            self?.three.setTitleColor(color, for: .normal)
        })
        
        /// FOUR OFFRIGHT to RIGHT
        self.fourOffRightToRight = Interpolate(from: self.four.center.x, to: self.four.rhs, function: BasicInterpolation.linear, apply: { [weak self] (position) in
            self?.four.center.x = position
        })
        
        /// FIVE CENTERRIGHT to OFFRIGHT
        self.fiveCenterRightToOffRight = Interpolate(from: self.five.center.x, to: self.five.offRight, apply: { [weak self] (position) in
            self?.five.center.x = position
        })
    }
    
    private func configurePage2to3() {
        
        /// ONE OFFLEFT to CENTERLEFT
        self.oneOffLeftToCenterLeft = Interpolate(from: self.one.offLeft, to: self.one.centerLeft, function: BasicInterpolation.linear, apply: { [weak self] (position) in
            self?.one.center.x = position
        })
        
        /// TWO LEFT to OFFLEFT
        self.twoLeftToOffLeft = Interpolate(from: self.two.lhs, to: self.two.offLeft, function: BasicInterpolation.linear, apply: { [weak self] (position) in
            self?.two.center.x = position
        })
        
        /// THREE CENTER to LEFT
        self.threeCenterToLeft = Interpolate(from: self.three.tabCenter, to: self.three.lhs, function: BasicInterpolation.linear, apply: { [weak self] (position) in
            self?.three.center.x = position
        })
        self.threeCenterToLeftAlpha = Interpolate(from: self.three.page.visible, to: self.three.page.hidden, apply: { [weak self] (color) in
            self?.three.setTitleColor(color, for: .normal)
        })
        
        /// FOUR RIGHT to CENTER
        self.fourRightToCenter = Interpolate(from: self.four.rhs, to: self.four.tabCenter, function: BasicInterpolation.linear, apply: { [weak self] (position) in
            self?.four.center.x = position
        })
        self.fourRightToCenterAlpha = Interpolate(from: self.four.page.hidden, to: self.four.page.visible, apply: { [weak self] (color) in
            self?.four.setTitleColor(color, for: .normal)
        })
        
        /// FIVE OFFRight to RIGHT
        self.fiveOffRightToRight = Interpolate(from: self.five.center.x, to: self.five.rhs, apply: { [weak self] (position) in
            self?.five.center.x = position
        })
        
    }
    
    private func configurePage3To4() {
        
        /// ONE CENTERLEFT to FARLEFT
        self.oneCenterleftToFarLeft = Interpolate(from: self.one.centerLeft, to: self.one.farLeft, apply: {  [weak self] (position) in
            self?.one.center.x = position
        })
        
        /// TWO OFFLEFT to CENTERLEFT
        self.twoOffLeftToCenterLeft = Interpolate(from: self.two.offLeft, to: self.two.centerLeft, apply: { [weak self] (position) in
            self?.two.center.x = position
        })
        
        /// THREE LEFT to OFFLeft
        self.threeLeftToOffLeft = Interpolate(from: self.three.lhs, to: self.three.offLeft, apply: { [weak self] (position) in
            self?.three.center.x = position
        })
        
        /// FOUR CENTER to LEFT
        self.fourCenterToLeft = Interpolate(from: self.four.tabCenter, to: self.four.lhs, apply: { [weak self] (position) in
            self?.four.center.x = position
        })
        
        self.fourCenterToLeftAlpha = Interpolate(from: self.four.page.visible, to: self.four.page.hidden, apply: { [weak self] (color) in
            self?.four.setTitleColor(color, for: .normal)
        })
        
        /// FIVE RIGHT to CENTER
        self.fiveRightToCenter = Interpolate(from: self.five.rhs, to: self.five.tabCenter, apply: { [weak self] (position) in
            self?.five.center.x = position
        })
        
        self.fiveRightToCenterAlpha = Interpolate(from: self.five.page.hidden, to: self.five.page.visible, apply: { [weak self] (color) in
            self?.five.setTitleColor(color, for: .normal)
        })
        
    }
}

extension TabView: PageboyViewControllerDelegate {
    
    open func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        
        self.three.pageboyViewController(pageboyViewController, didScrollTo: position, direction: direction, animated: animated)
        self.four.pageboyViewController(pageboyViewController, didScrollTo: position, direction: direction, animated: animated)
        self.five.pageboyViewController(pageboyViewController, didScrollTo: position, direction: direction, animated: animated)
        
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
            self.threeCenterToLeftAlpha?.progress = progressTo3
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
    
}
