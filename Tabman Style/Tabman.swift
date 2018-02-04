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
        self.backgroundColor = .white
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
    
    public func layoutItems() {
        for item in items {
            self.addSubview(item.button)
            item.button.snp.makeConstraints({ [weak self] (make) in
                guard let view = self else { return }
                make.centerY.equalTo(view.snp.centerY)
                if let position = item.position {
                    switch position {
                    case .left:
                        make.leading.equalTo(view.snp.leading).offset(16)
                    case .offLeft:
                        make.trailing.equalTo(view.snp.leading).offset(16)
                    case .centerLeft:
                        make.centerX.equalTo(view.snp.leading).offset(-(view.bounds.width / 2))
                    case .center:
                        make.centerX.equalTo(view.snp.centerX)
                    case .right:
                        make.trailing.equalTo(view.snp.trailing).offset(-16)
                    case .offRight:
                        make.leading.equalTo(view.snp.trailing).offset(16)
                    case .centerRight:
                        make.trailing.equalTo(view.snp.trailing).offset(view.bounds.width / 2)
                    }
                }
            })
            item.button.setNeedsLayout()
            item.button.layoutIfNeeded()
        }
    }
}

extension Tabman {
    
    private func interpolate(to position: Position, progress: CGFloat) {
       
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








