//
//  CustomCell.swift
//  teratail_45367
//
//  Created by Kentarou on 2016/08/24.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import UIKit


protocol CustomCellDelegate: class {
    func pushCellButton(cell: CustomCell)
}

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    weak var delegate: CustomCellDelegate!
    var cellIndexPath: NSIndexPath!
    
    
    var data: DataModel! {
        didSet {
            self.label.text = data.text
            self.cellButton.hidden = !data.isShowButton
        }
    }
    
    @IBAction func pushCellButton(sender: UIButton) {
        // ボタン押下時のイベント
        data.isOpenCell = !data.isOpenCell
        delegate?.pushCellButton(self)
    }
}
