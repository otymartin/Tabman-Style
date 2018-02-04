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
            self.position = .offRight
        }
    }
}
