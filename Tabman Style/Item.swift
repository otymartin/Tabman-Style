//
//  Item.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-03.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit


public struct Item {
    
    public var page: Page
    
    public var button: UIButton
    
    public var currentPosition: Position
    
    public init(page: Page, button: UIButton, currentPosition: Position) {
        self.page = page
        self.button = button
        self.currentPosition = currentPosition
    }
}

public enum Page {
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
