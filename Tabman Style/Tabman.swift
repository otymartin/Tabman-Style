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

public class Tabman: UIView {
    
    public var currentPosition: CGPoint? {
        return self.delegate?.currentPosition
    }
        
    public weak var delegate: BaseMainViewController?
  
}





