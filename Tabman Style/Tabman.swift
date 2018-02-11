//
//  Tabman.swift
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

public protocol TabmanResponder: class {
    
    func didTap(item: TabItem, at position: Position, in page: TabPage)
}

public class Tabman: UIView {
    
    public var one: TabItem!
    
    public var two: TabItem!
    
    public var three: TabItem!
    
    fileprivate var oneLeftToCenter: Interpolate?
    fileprivate var oneCenterToRight: Interpolate?
    fileprivate var oneRightToOffRight: Interpolate?
    
    fileprivate var twoCenterToRight: Interpolate?
    fileprivate var twoRightToOffRight: Interpolate?
    
    fileprivate var threeToOffRight: Interpolate?
    
    public var currentPosition: CGPoint? {
        return self.delegate?.currentPosition
    }
    
    public var responder: TabmanResponder?
    
    public weak var delegate: MainViewController?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.superview?.layoutIfNeeded()
    }
    
}

extension Tabman {
    
    fileprivate func setup() {
        self.backgroundColor = .white
        self.one = TabItem(for: .left, page: .one)
        self.two = TabItem(for: .center, page: .two)
        self.three = TabItem(for: .right, page: .three)
        self.layoutItems()
        self.configureInterpolations()
    }
    
    public func layoutItems() {
        self.addSubview(self.one.button)
        self.one.button.snp.makeConstraints { [weak self] (make) in
            guard let view = self else { return }
            make.centerY.equalTo(view.snp.centerY)
            make.leading.equalTo(view.snp.leading).offset(16)
        }
        
        self.addSubview(self.two.button)
        self.two.button.snp.makeConstraints { [weak self] (make) in
            guard let view = self else { return }
            make.centerY.equalTo(view.snp.centerY)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        self.addSubview(self.three.button)
        self.three.button.snp.makeConstraints { [weak self] (make) in
            guard let view = self else { return }
            make.centerY.equalTo(view.snp.centerY)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.superview?.layoutIfNeeded()
    }

}

extension Tabman {
    
    fileprivate func configureInterpolations() {
        self.configureOneLeftToCenter()
        self.configureTwoCenterToRight()
    }
    
    fileprivate func configureOneLeftToCenter(with direction: PageboyViewController.NavigationDirection? = nil) {
        self.oneLeftToCenter = Interpolate(from: self.one.button.center.x, to: self.one.center, function: BasicInterpolation.linear, apply: { [weak self] (newPosition) in
            self?.one.button.center.x = newPosition
        })
    }
    
    fileprivate func configureTwoCenterToRight(with direction: PageboyViewController.NavigationDirection? = nil) {
        self.twoCenterToRight = Interpolate(from: self.two.button.center.x, to: self.two.right, function: BasicInterpolation.linear, apply: { [weak self] (newPosition) in
            self?.two.button.center.x = newPosition
        })
    }
    
    fileprivate func configureThreeToOffright(with direction: PageboyViewController.NavigationDirection? = nil) {
        self.threeToOffRight = Interpolate(from: self.three.button.center.x, to: self.three.offRight, function: BasicInterpolation.linear, apply: { [weak self] (newPosition) in
            self?.three.button.center.x = newPosition
        })
    }
    
}


extension Tabman: PageboyViewControllerDelegate {
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController,
                                      willScrollToPageAt index: Int,
                                      direction: PageboyViewController.NavigationDirection,
                                      animated: Bool) {
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController,
                                      didScrollTo position: CGPoint,
                                      direction: PageboyViewController.NavigationDirection,
                                      animated: Bool) {
        let progress = 1 - (position.x)
        self.oneLeftToCenter?.progress = progress
        self.twoCenterToRight?.progress = progress
        self.threeToOffRight?.progress = progress
        
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController,
                                      didScrollToPageAt index: Int,
                                      direction: PageboyViewController.NavigationDirection,
                                      animated: Bool) {
     
    }
}








