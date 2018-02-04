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
    
    public var currentPage: Int?
    
    public var items: [TabItem] = []
    
    public var currentPosition: CGPoint?
    
    public var delegate: TabmanResponder?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Tabman {
    
    fileprivate func setup() {
        self.backgroundColor = .white
        self.layoutItems()
    }
    
    private func layoutItems() {
        
        for item in items {
            
            self.addSubview(item.button)
            
            item.button.snp.makeConstraints({ [weak self] (make) in
                guard let view = self else { return }
                make.centerY.equalTo(view.snp.centerY)
                make.centerX.equalTo(item.position.xPosition)
            })
        }
    }
    
}

extension Tabman {
    
    private func interpolate(to position: Position, progress: CGFloat) {
        var curve: UIViewAnimationCurve = .easeIn
        switch position {
        case .left, .right:
            curve = .easeIn
        case .center:
            curve = .easeOut
        case .offRight, .offLeft:
            curve = .easeOut
        }
        let interpolation = UIViewPropertyAnimator(duration: 0, curve: curve) {
            
        }
        interpolation.fractionComplete = progress
    }
}

extension Tabman: PageboyViewControllerDelegate {
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        
    }
}








