//
//  BaseViewController.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/13/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setText()
        setStyle()
        setDelegates()
        setObservers()
    }
    
    func setText() {
        navigationItem.title = getViewControllerTitle()
    }
    
    func setStyle() {
        initNavigationBarStyle()
        initRightBarMenuItems()
    }
    
    func setDelegates() {}
    
    func setObservers() {}
    
    func getViewControllerTitle() -> String? {
        fatalError("\(self) has to override this method \(#function)")
    }
    
    func initNavigationBarStyle() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = Colors.navigationBarFGColor
        navigationController?.navigationBar.barTintColor = Colors.navigationBarBGColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.navigationBarFGColor]
    }
    
    func initRightBarMenuItems() {
        if isSearchNavigationBarItemEnabled() {
            let searchBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            searchBtn.setImage(Icons.searchIcon, for: UIControl.State.normal)
            searchBtn.addTarget(self, action: #selector(searchBtnPressed), for: UIControl.Event.touchUpInside)
            let searchBarButtonItem = UIBarButtonItem(customView: searchBtn)
            navigationItem.rightBarButtonItem = searchBarButtonItem
        }
    }
    
    // Override this method with false incase no search btn needed in navigation bar
    func isSearchNavigationBarItemEnabled() -> Bool {
        return true
    }
    
    @objc func searchBtnPressed() {
        let searchViewController = SearchViewController(tableViewModel: SearchMoviesTableViewModel())
        navigationController?.pushViewController(searchViewController, animated: true)
    }
}
