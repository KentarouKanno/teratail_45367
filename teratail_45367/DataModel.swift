//
//  DataModel.swift
//  teratail_45367
//
//  Created by Kentarou on 2016/08/24.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import Foundation

class DataModel {
    var text       = ""
    var isOpenCell = false
    
    init(_ text: String = "", isOpenCell: Bool = false) {
        self.text = text
        self.isOpenCell = isOpenCell
    }
    
    class func createData() -> [[DataModel]] {
        let dataArray1 = [DataModel("A"), DataModel("B"), DataModel("C", isOpenCell: true), DataModel(), DataModel("E")]
        let dataArray2 = [DataModel("1"), DataModel("2", isOpenCell: true), DataModel()]
        let dataArray3 = [DataModel("a"), DataModel("b"), DataModel("c"), DataModel("d", isOpenCell: true)]
        return [dataArray1, dataArray2, dataArray3]
    }
}

