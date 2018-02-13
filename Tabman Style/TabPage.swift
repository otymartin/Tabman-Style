//
//  TabPage.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-03.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit

public enum TabPage {
    case one
    case two
    case three
    case four
    
    public var title: String {
        switch self {
        case .one:
            return "Profile"
        case .two:
            return "People"
        case .three:
            return "Standing"
        case .four:
            return "Invite"
        }
    }
    
    public var color: UIColor {
        switch self {
        case .one:
            return .green
        case .two:
            return .yellow
        case .three:
            return .red
        case .four:
            return .blue
        }
    }
}

public func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
    var i = 0
    return AnyIterator {
        let next = withUnsafeBytes(of: &i) { $0.load(as: T.self) }
        if next.hashValue != i { return nil }
        i += 1
        return next
    }
}
