//
//  TabItem.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-03.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit


public struct TabItem {
    
    public var button: TabmanButton
    
    public var position: Position
    
    public init(button: TabmanButton, position: Position) {
        self.button = button
        self.position = position
    }
}

public enum TabPage {
    case one
    case two
    case three
    case four
    case five
}

public enum Position {
    case left
    case right
    case center
    case offLeft
    case offright
    
    public var xPosition: CGFloat {
        switch self {
        case .left:
            return 16
        case .right:
            return UIScreen.main.bounds.width - 16
        case .center:
            return UIScreen.main.bounds.width / 2
        case .offLeft:
            return Position.left.xPosition - 116
        case .offright:
            return Position.right.xPosition + 116
        }
    }
}
