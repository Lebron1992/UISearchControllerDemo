//
//  SearchResultTableViewController.swift
//  UISearchController的使用
//
//  Created by 曾文志 on 12/02/2017.
//  Copyright © 2017 Lebron. All rights reserved.
//

import UIKit

class SearchResultTableViewController: UITableViewController {
    
    var dataSource: [String]! {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.kCellIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard dataSource != nil else { return 0 }
        
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = dataSource[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击cell后，做你想做的事")
    }
    
    private struct Constants {
        static let kCellIdentifier = "cell"
    }
}
