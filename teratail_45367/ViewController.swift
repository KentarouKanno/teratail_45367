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
        tableView.estimatedRowHeight = 20
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
        cell.textLabel?.text = dataArrayGroup[indexPath.section][indexPath.row].text
        cell.cellButton.hidden = !dataArrayGroup[indexPath.section][indexPath.row].isOpenCell
        cell.delegate = self
        cell.cellIndexPath = NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    func pushCellButton(underIndex: NSIndexPath) {
        let currentIndex = NSIndexPath(forRow: underIndex.row - 1, inSection: underIndex.section)
        
        if dataArrayGroup[currentIndex.section][currentIndex.row].isOpenCell {
            
            if  dataArrayGroup[underIndex.section].count - 1 < underIndex.row {
                // 配列の最後のCellが押された為処理しない
                return
            }
            
            dataArrayGroup[underIndex.section].removeAtIndex(underIndex.row)
            tableView.deleteRowsAtIndexPaths([underIndex], withRowAnimation: .Automatic)
            
        } else {
            
            dataArrayGroup[underIndex.section].insert(DataModel(), atIndex: underIndex.row)
            tableView.insertRowsAtIndexPaths([underIndex], withRowAnimation: .Automatic)
        }
        
        dataArrayGroup[currentIndex.section][currentIndex.row].isOpenCell = !dataArrayGroup[currentIndex.section][currentIndex.row].isOpenCell
        
    }
}

