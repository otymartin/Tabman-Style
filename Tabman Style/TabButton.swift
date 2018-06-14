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
import Interpolate

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
            return .white
        case .two:
            return .yellow
        case .three:
            return .blue
        case .four:
            return .red
        case .five:
            return .green
        }
    }
    
    
    public var initialTextColor: UIColor {
        switch self {
        case .one:
            return self.faded
        case .two:
            return self.visible
        case .three, .four, .five:
            return self.hidden
        }
    }
    
    public var initialIconColor: UIColor {
        switch self {
        case .three, .four, .five:
            return self.faded
        default:
            return self.hidden
        }
    }
    
    public var hidden: UIColor {
        return .clear
    }
    
    public var faded: UIColor {
        return UIColor.black.withAlphaComponent(0.4)
    }
    
    public var visible: UIColor {
        return .black
    }
}

import UIKit
import Spring
import Pageboy
import Interpolate

protocol TabButtonDelegate: class {
    
    func didTapTabButton(for page: TabPage)
}

final class TabButton: SpringButton {

    public weak var delegate: TabButtonDelegate?
    
    public var title: String = "" {
        didSet {
            self.setTitle(self.title, for: .normal)
        }
    }
    
    public var page: TabPage = .one
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
}

extension TabButton {
    
    private func configure() {
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        self.addTarget(self, action: #selector(self.Tap), for: .touchUpInside)
    }
    
   
    
    @objc func Tap() {
        self.delegate?.didTapTabButton(for: self.page)
    }
}


extension TabButton {
    
    private var margin: CGFloat {
        return 16
    }
    
    private var tabViewHeight: CGFloat {
        return 44
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
    
    public var tabCenterY: CGFloat {
        return self.tabViewHeight.divided(by: 2)
    }
    
    public var tabCenterX: CGFloat {
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




