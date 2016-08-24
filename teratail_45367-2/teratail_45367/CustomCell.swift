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
    
    @IBOutlet weak var underCellView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var underCellHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var cellButton: UIButton!
    
    var data: DataModel! {
        didSet {
            
            self.label.text = data.text
            self.cellButton.hidden = !data.isShowButton
            
            if data.isOpenCell {
                underCellView.hidden = false
                underCellHeightConstraint.constant = 44
            } else {
                
                underCellView.hidden = true
                underCellHeightConstraint.constant = 0
            }
        }
    }
    
    @IBAction func pushCellButton(sender: UIButton) {
        data.isOpenCell = !data.isOpenCell
        // ボタン押下時のイベント
        delegate?.pushCellButton(cellIndexPath)
    }
}
