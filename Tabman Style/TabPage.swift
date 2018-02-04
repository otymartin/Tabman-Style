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
    case five
    
    public var title: String {
        switch self {
        case .one:
            return "One"
        case .two:
            return "Two"
        case .three:
            return "Three"
        case .four:
            return "Four"
        case .five:
            return "Five"
        }
    }
    
    public var color: UIColor {
        switch self {
        case .one:
            return .red
        case .two:
            return .blue
        case .three:
            return .cyan
        case .four:
            return .yellow
        case .five:
            return .purple
        }
    }
}

extension Int {
    
    public var tabPage: TabPage? {
        
        for page in iterateEnum(TabPage.self) {
            if self == page.hashValue {
                return page
            }
        }
        return nil
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
