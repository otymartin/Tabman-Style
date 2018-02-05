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
    
    public var one: TabItem!
    
    public var two: TabItem!
    
    public var three: TabItem!
    
    public var four: TabItem!
    
    public var currentPosition: CGPoint? {
        return self.delegate?.currentPosition
    }
    fileprivate var forwardAnimator: UIViewPropertyAnimator?
    
    fileprivate var reverseAnimator: UIViewPropertyAnimator?
    
    public var responder: TabmanResponder?
    
    public weak var delegate: MainViewController?
    
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
    
    fileprivate func setup() {
        self.backgroundColor = .white
        self.one = TabItem(button: self.tabmanButton(for: .one), for: self)
        self.two = TabItem(button: self.tabmanButton(for: .two), for: self)
        self.three = TabItem(button: self.tabmanButton(for: .three), for: self)
        self.four = TabItem(button: self.tabmanButton(for: .four), for: self)
        self.layoutItems()
        self.forwardAnimator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut, animations: nil)
        self.reverseAnimator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut, animations: nil)
    }
    
    private func tabmanButton(for page: TabPage) -> TabmanButton {
        let button = TabmanButton()
        button.configure(for: page)
        return button
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
            make.center.equalTo(view.snp.center)
        }
        
        self.addSubview(self.three.button)
        self.three.button.snp.makeConstraints { [weak self] (make) in
            guard let view = self else { return }
            make.centerY.equalTo(view.snp.centerY)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        
        self.addSubview(self.four.button)
        self.four.button.snp.makeConstraints { [weak self] (make) in
            guard let view = self else { return }
            make.leading.equalTo(view.snp.trailing).offset(16)
        }
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.superview?.layoutIfNeeded()
    }
}


extension Tabman: PageboyViewControllerDelegate {
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        let progress = 1 - (self.currentPosition?.x ?? 0)
        print(progress)
        switch direction {
        case .forward:
            self.forwardAnimator?.fractionComplete = progress
        case .reverse:
            self.reverseAnimator?.fractionComplete = progress
        default:
            break
        }
        
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        let progress = 1 - (self.currentPosition?.x ?? 0)
        switch direction {
        case .forward:
            self.forwardAnimator?.fractionComplete = progress
        case .reverse:
            self.reverseAnimator?.fractionComplete = progress
        default:
            break
        }
    }
}








