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

public protocol TabmanResponder: class {
    
    func didTap(item: TabItem, at position: Position, in page: TabPage)
}

public class Tabman: UIView {
    
    public var one: TabItem!
    
    public var two: TabItem!
    
    public var three: TabItem!
    
    fileprivate var oneInterpolation: UIViewPropertyAnimator!
    
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
    
    fileprivate func interpolateOne(direction: Direction, with progress: CGFloat) {
        var toPosition = CGFloat()
        var curve: UIViewAnimationCurve = .easeIn
        
        /*guard let currentPage = self.delegate?.currentPage else { return }
        switch currentPage {
        case 0:
            switch direction {
            case .forward:
                toPosition =
            }
            toPosition = self.one.center
            curve = .easeOut
        case 1:
            toPosition = self.one.left
            curve = .easeInOut
        case 2:
            toPosition = self.one.center
            curve = .easeOut
        default:
            break
        }
        self.oneInterpolation = UIViewPropertyAnimator(duration: 1, curve: curve, animations: {
            self.one.button.bounds.origin.x = toPosition
        })*/

    }
    
    fileprivate func oneCompletion(progress: CGFloat) {
        self.oneInterpolation.fractionComplete = progress
    }
}


extension Tabman: PageboyViewControllerDelegate {
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction:
        PageboyViewController.NavigationDirection, animated: Bool) {
        
        var direction = self.one.direction
        switch direction {
        case .forward:
            direction = .forward
        case .reverse:
            direction = .reverse
        default:
            break
        }
        
        guard self.one.direction == direction else {
            self.interpolateOne(direction: direction, with: position.x)
            return
        }
        
        
        /*guard var currentPage = self.delegate?.currentPage else { return }
        var nextPage = CGFloat()
        switch direction {
        case .forward:
            nextPage = CGFloat(integerLiteral: currentPage) += 1
        case .reverse:
            nextPage = CGFloat(integerLiteral: currentPage) += -1
        default:
            break
        }
        self.oneCompletion(progress: position.x)*/
      
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
     
    }
}








