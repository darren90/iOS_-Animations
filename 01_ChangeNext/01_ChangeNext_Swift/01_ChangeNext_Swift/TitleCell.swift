//
//  TitleCell.swift
//  01_ChangeNext_Swift
//
//  Created by Fengtf on 2016/11/23.
//  Copyright © 2016年 ftf. All rights reserved.
//

import UIKit

class TitleCell: UICollectionViewCell {

    var titleStr:String?{
        didSet{
            titleL.text = titleStr
            titleL.sizeToFit()
        }
    }

    let titleL = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self .addSubview(titleL)
        titleL.textColor = UIColor.black
        titleL.font = UIFont.systemFont(ofSize: 12)
        titleL.numberOfLines = 2
        titleL.textAlignment = .left
        titleL.sizeToFit()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        titleL.frame = self.bounds
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



}
