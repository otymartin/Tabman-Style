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
    
    public var one: TabItem!
    
    public var two: TabItem!
    
    public var three: TabItem!
    
    public var currentPosition: CGPoint? {
        return self.delegate?.currentPosition
    }
    
    public var responder: TabmanResponder?
    
    public weak var delegate: MainViewController?
    
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
        self.one = TabItem(for: .left, page: .one)
        self.two = TabItem(for: .center, page: .two)
        self.three = TabItem(for: .right, page: .three)
        self.layoutItems()
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
            make.centerY.equalTo(view.snp.centerY)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        self.addSubview(self.three.button)
        self.three.button.snp.makeConstraints { [weak self] (make) in
            guard let view = self else { return }
            make.centerY.equalTo(view.snp.centerY)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }

    }

}





