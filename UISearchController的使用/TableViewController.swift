//
//  TableViewController.swift
//  UISearchController的使用
//
//  Created by 曾文志 on 12/02/2017.
//  Copyright © 2017 Lebron. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    fileprivate var searchResults: [String]!
    
    private var searchController: UISearchController!
    
    fileprivate var searchResultController: SearchResultTableViewController!
    
    fileprivate var dataSource: [String] {
        var strings = [String]()
        for _ in 0...20 {
            let str = "随机数" + String(arc4random())
            strings.append(str)
        }
        return strings
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.kCellIdentifier)
    }
    
    private func setupSearchController() {
        searchResultController = SearchResultTableViewController(style: .plain)
        searchController = UISearchController(searchResultsController: searchResultController)
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.placeholder = "搜索"
        
        tableView.tableHeaderView = searchController.searchBar
    }
    
    // MARK: - table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = dataSource[indexPath.row]
        
        return cell
    }
    
    // MARK: - UISearchResultsUpdating
    
    
    private struct Constants {
        static let kCellIdentifier = "cell"
    }
}


// MARK: - UISearchResultsUpdating
extension TableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        searchResults = []
        
        if let searchText = searchController.searchBar.text {
            for str in dataSource {
                if str.contains(searchText) {
                    searchResults.append(str)
                }
            }
        }
        
        searchResultController.dataSource = searchResults
    }
}


// MARK: - UISearchControllerDelegate
extension TableViewController: UISearchControllerDelegate {
    
    func presentSearchController(_ searchController: UISearchController) {
        print("presentSearchController")
    }
    
    func willPresentSearchController(_ searchController: UISearchController) {
        print("willPresentSearchController")
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        print("didPresentSearchController")
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        print("willDismissSearchController")
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        print("didDismissSearchController")
    }
}

