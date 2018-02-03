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

public class Tabman: UIView {
    
    enum Position {
        case left
        case right
        case center
        case offLeft
        case offright
        
        public var xPosition: CGFloat {
            switch self {
            case .left:
                return 16
            case .right:
                return UIScreen.main.bounds.width - 16
            case .center:
                return UIScreen.main.bounds.width / 2
            case .offLeft:
                return Position.left.xPosition - 116
            case .offright:
                return Position.right.xPosition + 116
            }
        }
    }
    
    public var items: [String]?
    
    public var currentPage: Int?
    
    public var currentPosition: CGPoint?
    
    public var delegate: TabmanViewController?
    
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
        self.currentPage = self.delegate?.currentIndex
        self.currentPosition = self.delegate?.currentPosition
    }
    
    private var itemLabel: UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.textColor = UIColor.black.withAlphaComponent(0.9)
        label.adjustsFontSizeToFitWidth = true
        return label
    }
    
    public func set(_ items: [String]) {
        print(items)
        for (index, item) in items.enumerated() {
            self.layout(item: item, at: index)
        }
    }
    
    private func layout(item: String, at index: Int) {
        let label = self.itemLabel
        label.text = item
        self.addSubview(label)
        
        switch index {
        case 0:
            label.snp.makeConstraints({ [weak self] (make) in
                if let view = self {
                    make.leading.equalTo(view.snp.leading).offset(-100)
                    make.centerY.equalTo(view.snp.centerY)
                }
            })
        case 1:
            label.snp.makeConstraints({ [weak self] (make) in
                if let view = self {
                    make.leading.equalTo(view.snp.leading).offset(16)
                    make.centerY.equalTo(view.snp.centerY)
                }
            })
        case 2:
            label.snp.makeConstraints({ [weak self] (make) in
                if let view = self {
                    make.center.equalTo(view.snp.center)
                }
            })
        case 3:
            label.snp.makeConstraints({ [weak self] (make) in
                if let view = self {
                    make.trailing.equalTo(view.snp.trailing).offset(-16)
                    make.centerY.equalTo(view.snp.centerY)
                }
            })
        case 4:
            label.snp.makeConstraints({ [weak self] (make) in
                if let view = self {
                    make.trailing.equalTo(view.snp.trailing).offset(100)
                    make.centerY.equalTo(view.snp.centerY)
                }
            })
        default:
            break
        }
    }
    
}

extension Tabman: PageboyViewControllerDelegate {
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        print(index)
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        print(position)
        
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        print(index)
        
    }
}








