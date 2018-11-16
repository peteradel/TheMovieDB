//
//  BaseTableViewController.swift
//  TheMovieDB
//
//  Created by Peter Sorial on 11/14/18.
//  Copyright © 2018 NEUGELB STUDIOS. All rights reserved.
//

import UIKit

class BaseTableViewController<TableViewModel: BaseTableViewModelProtocol, TableCell: BaseTableCellProtocol>: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableFooterView = TableFooterView()
    
    public var tableViewModel: TableViewModel
    
    @IBOutlet var tableView: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(tableViewModel: TableViewModel) {
        self.tableViewModel = tableViewModel
        super.init(nibName: "BaseTableViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableViewModel.loadData()
    }
    
    // MARK: - BaseViewController methods
    
    override func setStyle() {
        super.setStyle()
        
        tableView.register(UINib(nibName: TableCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: TableCell.cellIdentifier)
    }
    
    override func setDelegates() {
        super.setDelegates()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func setObservers() {
        super.setObservers()
        
        tableViewModel.isLoading.valueChanged = { [weak self] isLoading in
            if !isLoading {
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - BaseTableViewController
    
    func getTableViewModel() -> TableViewModel {
        fatalError("\(self) has to override this method \(#function)")
    }
    
    // MARK: - UITableViewDataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let tableViewCell = tableView.dequeueReusableCell(withIdentifier: TableCell.cellIdentifier) as? TableCell {
            (tableViewCell as? UITableViewCell)?.selectionStyle = UITableViewCell.SelectionStyle.none
            tableViewCell.bind(tableCellViewModel: tableViewModel.getCellViewModel(at: indexPath))
            return tableViewCell as? UITableViewCell ?? UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    // MARK: - UITableViewDataDelegate methods
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return ( tableViewModel.isLoadingDataEnabled && tableViewModel.isLoadMoreEnabled ? tableFooterView : nil)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return ( tableViewModel.isLoadingDataEnabled && tableViewModel.isLoadMoreEnabled ? 70 : CGFloat.leastNormalMagnitude)
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if tableViewModel.isLoadingDataEnabled && !tableViewModel.isLoading.value && tableViewModel.isLoadMoreEnabled {
            tableViewModel.loadMore()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
