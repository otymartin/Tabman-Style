//
//  ViewController.swift
//  Tabman Style
//
//  Created by Martin Otyeka on 2018-02-02.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit
import Tabman
import Pageboy
import SnapKit
import SwiftyTimer
import Interpolate

open class BaseMainViewController: TabmanViewController, TabViewDelegate {
    
    let tabView = TabView(frame: .zero)
    
    let button = UIButton()
    
    private lazy var modeIndicatorBar = UIView()
    
    private var viewControllers: [UIViewController] = []
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        //self.addTabView()
        //self.loadViewControllers()
        //self.dataSource = self
       // self.tabView.delegate = self
        
        button.setTitle("People", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalTo(view.snp.center)
        }
        //button.sizeToFit()
        
        Timer.after(5) {
            self.button.setTitle("Friends", for: .normal)
        }
    }
    
    
    private func addTabView() {
        self.tabView.delegate = self
        self.tabView.backgroundColor = .red
        self.view.addSubview(self.tabView)
        self.tabView.snp.makeConstraints { [weak self] (make) in
            guard let view = self?.view else { return }
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                make.top.equalTo(view.snp.top).offset(20)
            }
        }
    }
    
    func didTapTab(for page: TabPage) {
        Log.info(page)
    }
    
    override open func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, didScrollTo: position, direction: direction, animated: animated)
        self.tabView.pageboyViewController(pageboyViewController, didScrollTo: position, direction: direction, animated: animated)
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

extension BaseMainViewController: PageboyViewControllerDataSource {
    
    func loadViewControllers() {
        for page in iterateEnum(TabPage.self) {
            let pageViewController = PageViewController()
            pageViewController.page = page
            self.viewControllers.append(pageViewController)
        }
    }
    
    public func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return self.viewControllers.count
    }
    
    public func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return self.viewControllers[index]
    }
    
    public func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return Page.at(index: 1)
    }
}

