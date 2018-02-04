//
//  TabmanButton.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-03.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit

public protocol TabmanButtonResponder: class {
    
    func didTapButton(for page: Page, at position: Position)
}

public class TabmanButton: UIButton {
    
    public var page: Page?
    
    public var currentPosition: Position?
    
    public var title: String? {
        didSet {
            self.setTitle()
        }
    }
    
    public weak var delegate: TabmanButtonResponder?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TabmanButton {
    
    fileprivate func configure() {
        self.backgroundColor = .clear
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        self.addTarget(self, action: #selector(self.Tap), for: .touchUpInside)
    }
    
    @objc private func Tap() {
        guard let page = self.page, let currentPosition = self.currentPosition else { return }
        self.delegate?.didTapButton(for: page, at: currentPosition)
    }
    
    fileprivate func setTitle() {
        guard let title = self.title else { return }
        self.setTitle(title, for: .normal)
    }
}
