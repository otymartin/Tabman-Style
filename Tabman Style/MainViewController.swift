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
import Interpolate

public class MainViewController: TabmanViewController {
    
    
    @IBOutlet weak var tabman: UIView!
    @IBOutlet weak var one: TabmanButton!
    @IBOutlet weak var two: TabmanButton!
    @IBOutlet weak var three: TabmanButton!
    
    var xLabel = UILabel()
    var pageLabel = UILabel()
    var viewControllers: [UIViewController] = []
    
    fileprivate var oneLeftToCenter: Interpolate?
    fileprivate var twoCenterToRight: Interpolate?
    fileprivate var threeRightToOffRight: Interpolate?
    
    fileprivate var oneLeftToOffLeft: Interpolate?
    fileprivate var twoCenterToLeft: Interpolate?
    fileprivate var threeRightToCenter:Interpolate?

    var xPosition: CGFloat = 0 {
        didSet {
            self.xLabel.text = String(format: "x: %.2f", self.xPosition)
        }
    }
    var currentPage: Int? {
        didSet {
            self.pageLabel.text = String("page: \(self.currentPage ?? 0)")
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.configureViewControllers()
        self.configureUI()
        self.dataSource = self
    }
    
    override public func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, willScrollToPageAt: index, direction: direction, animated: animated)
    }
    
    override public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollTo position: CGPoint, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, didScrollTo: position, direction: direction, animated: animated)
        
        self.xPosition = position.x
        
        //if currentPage == 1 && direction == .reverse && position.x < 1 || currentPage == 0 && direction == .forward {
            let progress = 1 - (position.x)
            self.oneLeftToCenter?.progress = progress
            self.twoCenterToRight?.progress = progress
            self.threeRightToOffRight?.progress = progress
        //}
        
        //if currentPage == 1 && direction == .forward && position.x > 1 || currentPage == 2 && direction == .reverse {
            let completion = position.x - 1
            self.oneLeftToOffLeft?.progress = completion
            self.twoCenterToLeft?.progress = completion
            self.threeRightToCenter?.progress = completion
        //}
    }
    
    override public func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, didScrollToPageAt: index, direction: direction, animated: animated)
        self.currentPage = index
    }
}

extension MainViewController {
    
    func configureUI() {
        self.configureLabels()
        self.configureInterpolations()
        self.one.alpha = 0.4
        self.two.alpha = 1
        self.three.alpha = 0.4
    }
    
    private func configureLabels() {
        self.xLabel.configure()
        self.view.addSubview(self.xLabel)
        self.xLabel.snp.makeConstraints { (make) in
            make.center.equalTo(view.snp.center)
        }
        self.xPosition = 0.0
        
        self.pageLabel.configure()
        self.view.addSubview(self.pageLabel)
        self.pageLabel.snp.makeConstraints { [weak self] (make) in
            guard let xLabel = self?.xLabel else { return }
            make.top.equalTo(xLabel.snp.bottom).offset(5)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}

extension MainViewController {
    
    fileprivate func configureInterpolations() {
        self.configureOneLeftToCenter()
        self.configureTwoCenterToRight()
        self.configureThreeRightToOffRight()
        self.configureOneLeftToOffLeft()
        self.configureTwoCenterToLeft()
        self.configureThreeRightToCenter()
    }
    
    fileprivate func configureOneLeftToCenter() {
        
        self.oneLeftToCenter = Interpolate(from: self.one.center.x, to: self.one.offRight, apply: { (position) in
            self.one.center.x = position
        })
    }
    
    fileprivate func configureTwoCenterToRight() {
        self.twoCenterToRight = Interpolate(from: self.two.center.x, to: self.two.centerRight, apply: { (position) in
            self.two.center.x = position
        })
    }
    
    fileprivate func configureThreeRightToOffRight() {
        self.threeRightToOffRight = Interpolate(from: self.three.center.x, to: self.three.farRight, apply: { (position) in
            self.three.center.x = position
        })
    }
    
    fileprivate func configureOneLeftToOffLeft() {
        self.oneLeftToOffLeft = Interpolate(from: self.one.center.x, to: self.one.offLeft, apply: { (position) in
            self.one.center.x = position
        })
    }
    
    fileprivate func configureTwoCenterToLeft() {
        self.twoCenterToLeft = Interpolate(from: self.two.center.x, to: self.two.left, apply: { (position) in
            self.two.center.x = position
        })
    }
    
    fileprivate func configureThreeRightToCenter() {
        self.threeRightToCenter = Interpolate(from: self.three.center.x, to: self.three.superCenter, apply: { (position) in
            self.three.center.x = position
        })
    }
    
}


extension UILabel {
    
    public func configure() {
        self.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        self.textColor = UIColor.black.withAlphaComponent(0.8)
        self.textAlignment = .center
    }
}

extension MainViewController: PageboyViewControllerDataSource {
    
    func configureViewControllers() {
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

