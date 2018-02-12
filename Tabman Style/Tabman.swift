//
//  Tabman.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-02.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit
import Tabman
import Pageboy
import SnapKit

public protocol TabmanResponder: class {
    
    func didTap(item: TabmanButton, at position: Position, in page: TabPage)
}

public class Tabman: UIView {
    
    public var currentPosition: CGPoint? {
        return self.delegate?.currentPosition
    }
    
    public var responder: TabmanResponder?
    
    public weak var delegate: MainViewController?
    
  
    
}





