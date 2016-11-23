//
//  ImageCell.swift
//  01_ChangeNext_Swift
//
//  Created by Fengtf on 2016/11/23.
//  Copyright © 2016年 ftf. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {

    var url:String?{
        didSet {
            guard let uurl = URL(string: url!) else {
                return
            }
            imageView.sd_setImage(with: uurl)
        }
    }

    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)


        self.addSubview(imageView)
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        imageView.frame = self.bounds
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
