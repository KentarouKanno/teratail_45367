//
//  ViewController.swift
//  teratail_45367
//
//  Created by Kentarou on 2016/08/24.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Section Title
    let sectionTitleArray = ["Section-1", "Section-2", "Section-3"]
    
    var dataArrayGroup: [[DataModel]] = DataModel.createData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    // MARK: - TableView Delegate & DataSource
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitleArray[section]
    }
    
    // Section Count
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataArrayGroup.count
    }
    
    // Row Count
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArrayGroup[section].count
    }
    
    // Generate Cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCell        
        cell.delegate = self
        cell.data = dataArrayGroup[indexPath.section][indexPath.row]
        cell.cellIndexPath = indexPath
        return cell
    }
    
    func pushCellButton(indexPath: NSIndexPath) {
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
}

