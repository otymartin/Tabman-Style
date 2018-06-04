//
//  TabmanButton.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-03.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

//
//  TabButton.swift
//  TabButton
//
//  Created by Martin Otyeka on 2018-06-03.
//  Copyright © 2018 New Capsule Corp. All rights reserved.
//

import UIKit
import Spring
import Pageboy

public enum TabPage {
    case one
    case two
    case three
    case four
    case five
    
    public var title: String {
        switch self {
        case .one:
            return "One"
        case .two:
            return "Two"
        case .three:
            return "Three"
        case .four:
            return "Four"
        case .five:
            return "Five"
        }
    }
    
    public var color: UIColor {
        switch self {
        case .one:
            return .green
        case .two:
            return .yellow
        case .three:
            return .red
        case .four:
            return .blue
        case .five:
            return .purple
        }
    }
    
    public var startingAlpha: CGFloat {
        return self == .two ? 1 : 0.4
    }
}

public enum SecondTitlePosition {
    case left
    case right
}

public protocol TabButtonDelegate: class {
    
    func didTapTabButton(for page: TabPage)
}

public class TabButton: SpringButton {
    
    public var page: TabPage = .one
    
    private var position: SecondTitlePosition  = .left
    
    public var secondTitle: NSAttributedString? {
        didSet {
            self.setSecondTitle()
        }
    }
    
    private var secondTitleLabel: UILabel?
    
    public var title: String = "" {
        didSet {
            self.setTitle(self.title, for: .normal)
        }
    }
    
    public weak var delegate: TabButtonDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
    }
}

extension TabButton {
    
    fileprivate func configure() {
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        self.addTarget(self, action: #selector(self.Tap), for: .touchUpInside)
    }
    
    private func setSecondTitle() {
        if self.secondTitleLabel == nil {
            self.addSecondTitleLabel()
        }
        self.secondTitleLabel?.attributedText = self.secondTitle
    }
    
    private func addSecondTitleLabel() {
        self.secondTitleLabel = UILabel()
        self.secondTitleLabel?.alpha = 1
        guard let secondTitleLabel = self.secondTitleLabel else { return }
        self.addSubview(secondTitleLabel)
        secondTitleLabel.snp.makeConstraints { [weak self] (make) in
            guard let view = self else { return }
            make.trailing.equalTo(view.snp.trailing)
            make.centerY.equalTo(view.snp.centerY)
        }
    }
    
    @objc func Tap() {
        self.delegate?.didTapTabButton(for: self.page)
    }
}

extension TabButton: PageboyViewControllerDelegate {
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        
    }
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        
    }
}

extension TabButton {
    
    public var centerX: CGFloat {
        switch self.page {
        case .one:
            return self.lhs
        case .two:
            return self.tabCenter
        case .three:
            return self.rhs
        case .four:
            return self.offRight
        case .five:
            return self.centerRight
        }
    }
}

extension TabButton {
    
    private var tabViewHeight: CGFloat {
        return 44
    }
    
    public var centerY: CGFloat {
        return self.tabViewHeight.divided(by: 2)
    }
    
    private var margin: CGFloat {
        return 16
    }
    
    public var width: CGFloat {
        return self.bounds.width
    }
    
    public var height: CGFloat {
        return self.bounds.height
    }
    
    public var halfOfWidth: CGFloat {
        return self.width.divided(by: 2)
    }
    
    public var halfOfHeight: CGFloat {
        return self.height.divided(by: 2)
    }
    
    private var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    public var farLeft: CGFloat {
        return -(self.screenWidth - (self.halfOfWidth + self.margin))
    }
    
    public var centerLeft: CGFloat {
        return -(self.screenWidth.divided(by: 2).subtracting(self.halfOfWidth))
    }
    
    public var offLeft: CGFloat {
        return -(self.margin.adding(self.halfOfWidth))
    }
    
    public var lhs: CGFloat {
        return self.margin.adding(self.halfOfWidth)
    }
    
    public var tabCenter: CGFloat {
        return self.screenWidth.divided(by: 2)
    }
    
    public var rhs: CGFloat {
        return self.screenWidth.subtracting(self.margin.adding(self.halfOfWidth))
    }
    
    public var offRight: CGFloat {
        return self.screenWidth.adding(self.margin.adding(self.halfOfWidth))
    }
    
    public var centerRight: CGFloat {
        return self.screenWidth.adding(self.screenWidth.divided(by: 2).subtracting(self.halfOfWidth))
    }
    
    public var farRight: CGFloat {
        return self.screenWidth.multiplied(by: 2).subtracting(self.margin.adding(self.halfOfWidth))
    }
    
    public var farOffRight: CGFloat {
        return self.screenWidth.multiplied(by: 2).adding(self.margin.adding(self.halfOfWidth))
    }
    
    public var farCenterRight: CGFloat {
        return self.screenWidth.multiplied(by: 2) + self.screenWidth.divided(by: 2) + self.halfOfWidth
    }
}

public extension CGFloat {
    
    public func subtracting(_ value: CGFloat) -> CGFloat {
        return self - value
    }
    
    public func multiplied(by: CGFloat) -> CGFloat {
        return self * by
    }
    
    public func divided(by: CGFloat) -> CGFloat {
        return self / by
    }
    
    public func adding(_ value: CGFloat) -> CGFloat {
        return self + value
    }
}





