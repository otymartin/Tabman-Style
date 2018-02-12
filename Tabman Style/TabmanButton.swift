//
//  TabmanButton.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-03.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit


public protocol TabmanButtonDelegate: class {
    
    func didTapButton(for page: TabPage)
}

public class TabmanButton: UIButton {
    
    public var page: TabPage? {
        didSet {
            guard let page = self.page else { return }
            self.setTitle(page.title, for: .normal)
        }
    }
    
    public weak var delegate: TabmanButtonDelegate?
    
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

extension TabmanButton {
    
    public func configure() {
        self.setTitleColor(UIColor.black.withAlphaComponent(0.9), for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        self.addTarget(self, action: #selector(self.Tap), for: .touchUpInside)
    }
    
    @objc private func Tap() {
        guard let page = self.page else { return }
        self.delegate?.didTapButton(for: page)
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

}
