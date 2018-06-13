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

public protocol TabButtonDelegate: class {
    
    func didTapTabButton(for page: TabPage)
}

public class TabButton: SpringButton {
    
    private var hopOneAlpha: Interpolate?
    
    private var hopTwoAlpha: Interpolate?
    
    private var hopThreeAlpha: Interpolate?
    
    public var page: TabPage = .one {
        didSet {
            switch self.page {
            case .three, .four, .five:
                self.addIconLabels()
            default:
                break
            }
        }
    }
    
    private var leftIconLabel: UILabel?
    
    private var rightIconLabel: UILabel?
    
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
}

extension TabButton {
    
    fileprivate func configure() {
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        self.addTarget(self, action: #selector(self.Tap), for: .touchUpInside)
    }

    private func addIconLabels() {
        
        self.leftIconLabel = UILabel()
        self.leftIconLabel?.text = "💎3"
        self.leftIconLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        self.leftIconLabel?.isUserInteractionEnabled = false
        self.leftIconLabel?.alpha = self.page.leftIconStartingAlpha
        guard let leftIconLabel = self.leftIconLabel else { return }
        self.addSubview(leftIconLabel)
        leftIconLabel.snp.makeConstraints { [weak self] (make) in
            guard let view = self else { return }
            make.leading.equalTo(view.snp.leading)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        self.rightIconLabel = UILabel()
        self.rightIconLabel?.text = "💎3"
        self.rightIconLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        self.rightIconLabel?.isUserInteractionEnabled = false
        self.rightIconLabel?.alpha = self.page.rightIconStartingAlpha
        guard let rightIconLabel = self.rightIconLabel else { return }
        self.addSubview(rightIconLabel)
        rightIconLabel.snp.makeConstraints { [weak self] (make) in
            guard let view = self else { return }
            make.trailing.equalTo(view.snp.trailing)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        self.configureInterpolations()
    }
    
    private func configureInterpolations() {
        self.hopOneAlpha = Interpolate(from: 0.4, to: 0 , apply: { [weak self] (alpha) in
            self?.rightIconLabel?.alpha = alpha
        })
        /// THREE CENTER (0) TO LEFT (0.4)
        /// FOUR RIGHT (0.4) TO CENTER (0)
        self.hopTwoAlpha = Interpolate(from: self.page == .three ? CGFloat(0) : 0.4, to: self.page == .three ? 0.4 : 0, apply: { [weak self] (alpha) in
            guard let page = self?.page else { return }
            switch page {
            case .three:
                self?.leftIconLabel?.alpha = alpha
            case .four:
                self?.rightIconLabel?.alpha = alpha
            default:
                break
            }
        })
        /// FOUR CENTER (0) to LEFT (0.4)
        /// FIVE RIGHT (0.4) TO CENTER (0)
        self.hopThreeAlpha = Interpolate(from: self.page == .four ? CGFloat(0) : 0.4, to: self.page == .four ? 0.4 : 0, apply: { [weak self] (alpha) in
            guard let page = self?.page else { return }
            switch page {
            case .four:
                self?.leftIconLabel?.alpha = alpha
            case .five:
                self?.rightIconLabel?.alpha = alpha
            default:
                break
            }
        })
    }
    
    @objc func Tap() {
        self.delegate?.didTapTabButton(for: self.page)
    }
}

extension TabButton {
    
    public func setIconTitles(left: String, right: String, with icon: UIImage?) {
       
    }
    
    
    
}

extension TabButton: PageboyViewControllerDelegate {
    
    public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
       
        let progressTo2 = position.x - 1
        let progressTo3 = position.x - 2
        let progressTo4 = position.x - 3

        if progressTo2 >= 0 && position.x >= 1 && position.x <= 2 {
            switch self.page {
            case .three:
                self.hopOneAlpha?.progress = progressTo2
            default:
                break
            }
        }
        if progressTo3 >= 0 && position.x >= 2 && position.x <= 3 {
            switch self.page {
            case .three, .four:
                self.hopTwoAlpha?.progress = progressTo3
            default:
                break
            }
        }
        if progressTo4 >= 0 && position.x >= 3 {
            switch self.page {
            case .four, .five:
                self.hopThreeAlpha?.progress = progressTo4
            default:
                break
            }
        }
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




