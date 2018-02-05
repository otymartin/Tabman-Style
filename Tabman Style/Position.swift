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
    case farRight
    
    public func xPosition(for item: TabItem) -> CGFloat? {
        switch self {
        case .left:
            return 16 + item.button.bounds.width
        case .offLeft:
            return -16
        case .centerLeft:
            return -(UIScreen.main.bounds.width / 2)
        case .center:
            return UIScreen.main.bounds.width / 2
        case .right:
            return UIScreen.main.bounds.width - 16
        case .offRight:
            return UIScreen.main.bounds.width + 16
        case .centerRight:
            return UIScreen.main.bounds.width + (UIScreen.main.bounds.width / 2)
        case .farRight:
            return (UIScreen.main.bounds.width * 2) - 16
        }
    }
    
    public func toPosition(for item: TabItem, with direction: Direction) -> CGFloat? {
        
        switch self {
        case .left:
            switch direction {
            case .forward:
                return Position.center.xPosition(for: item)
            case .reverse:
                return Position.centerLeft.xPosition(for: item)
            default:
                return nil
            }
        case .offLeft:
            switch direction {
            case .forward:
                return Position.left.xPosition(for: item)
            case .reverse:
                return Position.centerLeft.xPosition(for: item)
            default:
                return nil
            }
        case .right:
            switch direction {
            case .forward:
                return Position.offRight.xPosition(for: item)
            case .reverse:
                return Position.centerLeft.xPosition(for: item)
            default:
                return nil
            }
        case .offRight:
            switch direction {
            case .forward:
                return Position.centerRight.xPosition(for: item)
            case .reverse:
                return Position.right.xPosition(for: item)
            default:
                return nil
            }
        case .center:
            switch direction {
            case .forward:
                return Position.right.xPosition(for: item)
            case .reverse:
                return Position.left.xPosition(for: item)
            default:
                return nil
            }
        case .centerRight:
            switch direction {
            case .forward:
                return Position.farRight.xPosition(for: item)
            case .reverse:
                return Position.offRight.xPosition(for: item)
            default:
                return nil
            }
        case .farRight:
            if direction == .reverse {
                return Position.offRight.xPosition(for: item)
            }
            return nil
        case .centerLeft:
            if direction == .forward {
                return Position.offLeft.xPosition(for: item)
            }
            return nil
        }
    }
    
}
