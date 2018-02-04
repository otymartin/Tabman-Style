//
//  TabItem.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-03.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit

public struct TabItem {
    
    private weak var view: UIView?
    
    private var position: Position?

    public var button: TabmanButton
    
    public init(button: TabmanButton, in view: UIView) {
        self.view = view
        self.button = button
        self.setInitialPosition(for: self.button)
    }
}

extension TabItem {
    
    fileprivate mutating func setInitialPosition(for button: TabmanButton) {
        guard let page = button.page, let view = self.view else { return }
        switch page {
        case .one:
            self.position = .left
        case .two:
            self.position = .center(inView: view)
        case .three:
            self.position = .right(forButton: self.button, inView: view)
        case .four:
            self.position = .centerRight(inView: view)
        }
    }
}

public enum Position {
    
    case left
    case right(forButton: UIButton, inView: UIView)
    case center(inView: UIView)
    case centerRight(inView: UIView)
    case centerLeft(inView: UIView)
    case farLeft(inView: UIView)
    case farRight(forButton: UIButton, inView: UIView)
    
    public var xPosition: CGFloat {
        switch self {
        case .left:
            return 16
        case .centerLeft(let view):
            return view.bounds.width / 2
        case .farLeft(let view):
            return -(view.bounds.width - Position.left.xPosition)
        case .center(let view):
            return view.bounds.width / 2
        case .right(let button, let view):
            return view.bounds.width - (button.bounds.width + 16)
        case .centerRight(let view):
            return view.bounds.width / 2
        case .farRight(let button, let view):
            return (view.bounds.width * 2) - (button.bounds.width + 16)
        }
    }
    
}
