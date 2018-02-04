//
//  TabItem.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-03.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit

public struct TabItem {
    
    public var view: UIView?
    
    public var position: Position?

    public var button: TabmanButton
    
    public init(button: TabmanButton, for tabman: Tabman) {
        self.view = tabman
        self.button = button
        self.setInitialPosition()
    }
}

extension TabItem {
    
    fileprivate mutating func setInitialPosition() {
        guard let page = self.button.page else { return }
        switch page {
        case .one:
            self.position = .left
        case .two:
            self.position = .center
        case .three:
            self.position = .right
        case .four:
            self.position = .centerRight
        }
    }
}

public enum Position {
    
    case left
    case right
    case center
    case centerRight
    case centerLeft
    case farLeft
    case farRight
    
    public func xPosition(item: TabItem) -> CGFloat? {
        guard let view = item.view else { return nil }
        switch self {
        case .left:
            return 16 + item.button.bounds.width
        case .centerLeft:
            return view.bounds.width / 2
        case .farLeft:
            return -(view.bounds.width - (16 + item.button.bounds.width))
        case .center:
            return view.bounds.width / 2
        case .right:
            return view.bounds.width - 16
        case .centerRight:
            return view.bounds.width + (view.bounds.width / 2)
        case .farRight:
            return (view.bounds.width * 2) - (item.button.bounds.width + 16)
        }
    }
    
}
