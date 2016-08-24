//
//  DataModel.swift
//  teratail_45367
//
//  Created by Kentarou on 2016/08/24.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import Foundation

class DataModel {
    var text         = ""
    var isShowButton = false
    var isOpenCell   = false
    
    init(_ text: String = "", isShowButton: Bool = false, isOpenCell: Bool = false) {
        self.text = text
        self.isShowButton = isShowButton
        self.isOpenCell   = isOpenCell
    }
    
    class func createData() -> [[DataModel]] {
        let dataArray1 = [DataModel("A"), DataModel("B"), DataModel("C", isShowButton:true), DataModel("D"), DataModel("E")]
        let dataArray2 = [DataModel("1"), DataModel("2", isShowButton:true), DataModel("3")]
        let dataArray3 = [DataModel("a"), DataModel("b"), DataModel("c"), DataModel("d", isShowButton:true)]
        return [dataArray1, dataArray2, dataArray3]
    }
}

