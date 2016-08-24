//
//  CustomCell.swift
//  teratail_45367
//
//  Created by Kentarou on 2016/08/24.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import UIKit


protocol CustomCellDelegate: class {
    func pushCellButton(indexPath: NSIndexPath)
}

class CustomCell: UITableViewCell {

    weak var delegate: CustomCellDelegate!
    var cellIndexPath: NSIndexPath!
    
    @IBOutlet weak var cellButton: UIButton!
    
    @IBAction func pushCellButton(sender: UIButton) {
        // ボタン押下時のイベント
        delegate?.pushCellButton(cellIndexPath)
    }
}
