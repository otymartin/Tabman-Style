//
//  TabItem.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-03.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

public struct TabItem {
    
    public var position: Position
    
    public var button: TabmanButton
    
    public var direction: PageboyViewController.NavigationDirection = .forward
    
    public init(for position: Position, page: TabPage) {
        self.position = position
        self.button = TabmanButton()
        self.button.configure(for: page)
    }
}

extension TabItem {
    
    public var offLeft: CGFloat {
        return -(16 + (self.button.bounds.width / 2))
    }
    
    public var left: CGFloat {
        return 16 + (self.button.bounds.width / 2)
    }
    
    public var center: CGFloat {
        return (UIScreen.main.bounds.width / 2)
    }
    
    public var right: CGFloat {
        return UIScreen.main.bounds.width - (16 + (self.button.bounds.width / 2))
    }
    
    public var offRight: CGFloat {
        return UIScreen.main.bounds.width + (16 + (self.button.bounds.width / 2))
    }
    
    public var centerRight: CGFloat {
        return UIScreen.main.bounds.width + (UIScreen.main.bounds.width / 2) - (self.button.bounds.width / 2)
    }
    
    public var farRight: CGFloat {
        return (UIScreen.main.bounds.width * 2) - (16 + (self.button.bounds.width / 2))
    }
}
