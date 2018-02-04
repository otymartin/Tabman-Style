//
//  PageViewController.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-03.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit

open class PageViewController: UIViewController {
    
    var page: TabPage?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.page?.title ?? ""
        self.view.backgroundColor = self.page?.color ?? .white
    }
}
