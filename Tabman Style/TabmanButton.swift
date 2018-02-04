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
    
    public var page: TabPage?
    
    public weak var delegate: TabmanButtonDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
    }
}

extension TabmanButton {
    
    public func configure(for page: TabPage) {
        self.page = page
        self.setTitleColor(UIColor.black.withAlphaComponent(0.9), for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        self.addTarget(self, action: #selector(self.Tap), for: .touchUpInside)
        self.setTitle()
    }
    
    @objc private func Tap() {
        guard let page = self.page else { return }
        self.delegate?.didTapButton(for: page)
    }
    
    fileprivate func setTitle() {
        guard let page = self.page else { return }
        self.setTitle(page.title, for: .normal)
    }
}
