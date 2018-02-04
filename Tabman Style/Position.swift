//
//  Position.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-04.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit

public enum Direction {
    case neutral
    case forward
    case reverse
}

public enum Position {
    
    case left
    case offLeft
    case centerLeft
    case center
    case right
    case offRight
    case centerRight
    
    public func xPosition(for item: TabItem) -> CGFloat? {
        guard let view = item.view else { return nil }
        switch self {
        case .left:
            return 16 + item.button.bounds.width
        case .offLeft:
            return -16
        case .centerLeft:
            return -(view.bounds.width / 2)
        case .center:
            return view.bounds.width / 2
        case .right:
            return view.bounds.width - 16
        case .offRight:
            return view.bounds.width + 16
        case .centerRight:
            return view.bounds.width + (view.bounds.width / 2)
        }
    }
    
    public func toPosition(for item: TabItem, with direction: Direction) -> Position? {
        
        switch self {
        case .left:
            switch direction {
            case .forward:
                return Position.center
            case .reverse:
                return Position.centerLeft
            default:
                return nil
            }
        case .offLeft:
            switch direction {
            case .forward:
                return Position.left
            case .reverse:
                return Position.centerLeft
            default:
                return nil
            }
        case .right:
            switch direction {
            case .forward:
                return Position.offRight
            case .reverse:
                return Position.centerLeft
            default:
                return nil
            }
        case .offRight:
            switch direction {
            case .forward:
                return Position.centerRight
            case .reverse:
                return Position.right
            default:
                return nil
            }
        case .center:
            switch direction {
            case .forward:
                return Position.right
            case .reverse:
                return Position.left
            default:
                return nil
            }
        case .centerRight:
            if direction == .reverse {
                return Position.offRight
            }
            return nil
        case .centerLeft:
            if direction == .forward {
                return Position.offLeft
            }
            return nil
        }
    }
    
}
