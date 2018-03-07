//
//  TabmanButton.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-03.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit

public class TabmanButton: UIButton {
        
    public var page: TabPage? {
        didSet {
            guard let page = self.page else { return }
            self.setTitle(page.title, for: .normal)
        }
    }
    
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
        super.layoutSubviews()
        self.layoutIfNeeded()
    }
}

extension CGFloat {
    
    public func divided(by: CGFloat) -> CGFloat {
        return self / by
    }
    
    public func add(_ number: CGFloat) -> CGFloat {
        return self + number
    }
    
    public func subtract(_ number: CGFloat) -> CGFloat {
        return self - number
    }
}

extension TabmanButton {
    
    private var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    public func configure() {
        self.setTitleColor(UIColor.black.withAlphaComponent(0.9), for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
    }
    
    public var farLeft: CGFloat {
        return -((self.screenWidth + self.screenWidth.divided(by: 2)) - 16)
    }
    
    public var centerLeft: CGFloat {
        return -((UIScreen.main.bounds.width / 2) - (self.bounds.width / 2))
    }
    
    public var offLeft: CGFloat {
        return -(16 + (self.bounds.width / 2))
    }
    
    public var left: CGFloat {
        return 16 + (self.bounds.width / 2)
    }
    
    public var superCenter: CGFloat {
        return (UIScreen.main.bounds.width / 2)
    }
    
    public var right: CGFloat {
        return UIScreen.main.bounds.width - (16 + (self.bounds.width / 2))
    }
    
    public var offRight: CGFloat {
        return UIScreen.main.bounds.width + (16 + (self.bounds.width / 2 ))
    }
    
    public var centerRight: CGFloat {
        return UIScreen.main.bounds.width + (UIScreen.main.bounds.width / 2) - (self.bounds.width / 2)
    }
    
    public var farRight: CGFloat {
        return (UIScreen.main.bounds.width * 2) - (16 + (self.bounds.width / 2))
    }
    
    public var farOffRight: CGFloat {
        return (UIScreen.main.bounds.width * 2) + (16 + (self.bounds.width / 2))
    }
    
    public var farCenterRight: CGFloat {
        return (self.screenWidth * 2) + (self.screenWidth.divided(by: 2).add(self.bounds.width.divided(by: 2)))
    }

}







