//
//  ViewController.swift
//  01_ChangeNext_Swift
//
//  Created by Fengtf on 2016/11/23.
//  Copyright © 2016年 ftf. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    let magin = 20.0
    let KimageH = 80.0
    let KtitleH = 36.0
    let Krow = 3
    var imgs:[String] = []
    var titles:[String] = []
    var panCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


        view.addSubview(imageCollectionView)
        view.addSubview(titleCollectionView)
        view.addSubview(changeBtn)

        createDatas()
    }

    func flowLayout(itemH:Double) -> UICollectionViewFlowLayout {
        let itemW = (self.view.frame.width - (3 + 1)*20.0) / 3

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: Double(itemW), height: itemH)
        return layout
    }

    func changeItem () {


        panCount = panCount + 1
    }

    func imageScroll(offsetY:Double ,isAnimation:Bool) {
        let imgY = (imgs.count / Krow) * KimageH - KimageH

        let imgRect = CGRect(x: 0, y: imgY - panCount * offsetY, width: imageCollectionView.frame.width, height: imageCollectionView.frame.height)


    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.imageCollectionView{
            return imgs.count
        }else{
            return titles.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.imageCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath) as! ImageCell
            cell.url = imgs[indexPath.item]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "title", for: indexPath) as! TitleCell
            cell.titleStr = titles[indexPath.item]
            return cell
        }
    }

    lazy var imageCollectionView :UICollectionView = {
        let view = UICollectionView(frame: CGRect(x: 20.0, y: 100.0, width: self.view.frame.width - 2 *  20.0, height: 80.0), collectionViewLayout: self.flowLayout(itemH: 80.0))
        view.isScrollEnabled = false
        view.showsVerticalScrollIndicator = false
        view.bounces = false
        view.delegate = self
        view.dataSource = self
        view.register(ImageCell.self, forCellWithReuseIdentifier: "image")
        view.backgroundColor = UIColor.white
        return view
    }()

    lazy var titleCollectionView:UICollectionView = {
        let view = UICollectionView(frame: CGRect(x: 20.0, y: self.imageCollectionView.frame.maxY + 10, width: self.view.frame.width - 2 *  20.0, height: 36.0), collectionViewLayout: self.flowLayout(itemH: 36.0))
        view.isScrollEnabled = false
        view.showsVerticalScrollIndicator = false
        view.bounces = false
        view.delegate = self
        view.dataSource = self
        view.register(TitleCell.self, forCellWithReuseIdentifier: "title")
        view.backgroundColor = UIColor.white
        return view
    }()

    lazy var changeBtn:UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 50, y: self.titleCollectionView.frame.maxY + 10, width: self.view.frame.width - 2 * 50, height: 30)
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = UIColor.darkGray.cgColor
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 15
        btn.clipsToBounds = true
        btn.setTitle(" 换一换", for: .normal)
        btn.setImage(UIImage(named: "change"), for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(changeItem), for: .touchUpInside)
        return btn
    }()



    func createDatas() {
        imgs = [
        "https://cdn.ruguoapp.com/o_1arlie05i7tl1lj51jos6nnorgo.jpg?imageView2/0/w/120/h/120/q/30/interlace/1",

        "https://cdn.ruguoapp.com/o_1a94vutm61tdr5vc4o2uv1a8d3t.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

        "https://cdn.ruguoapp.com/o_1a9501qkj15j914v71o52g5q1qdo3m.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

        "https://cdn.ruguoapp.com/o_1abf29p7ilgl19lkrl629l1d3d17.png?imageView2/0/w/120/h/120/q/30",

        "https://cdn.ruguoapp.com/o_1a94vu844jab1mf516gm1euj1lrr6.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

        "https://cdn.ruguoapp.com/o_1a94vv8sg1nejjfjbbg10fv1q3v5t.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

        "https://cdn.ruguoapp.com/FgEUzMvwk8QiCWLuy2sHx-DKKHkS.jpg?imageView2/0/w/120/h/120/q/30/interlace/1",

        "https://cdn.ruguoapp.com/o_1aa6bm0ku3m07rd1eai1f2e3h0o.jpg?imageView2/0/w/120/h/120/q/30/interlace/1",

        "https://cdn.ruguoapp.com/o_1a94vqmsf134u19h11lablfeenh9b.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

        "https://cdn.ruguoapp.com/o_1aklbgu2v38q1sla1s966nla1m.jpg?imageView2/0/w/120/h/120/q/30/interlace/1",

        "https://cdn.ruguoapp.com/o_1a94vp9imur31288cr21ef9ol1b.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

        "https://cdn.ruguoapp.com/o_1ah5scjl1f0a1qogdm2gpt4u4j.png?imageView2/0/w/120/h/120/q/30",

        "https://cdn.ruguoapp.com/o_1af8d3pq0ugjsai1akr1mcjlvs1g.png?imageView2/0/w/120/h/120/q/30",

        "https://cdn.ruguoapp.com/o_1a94vucfamf31e3dqvt3f116j310.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

        "https://cdn.ruguoapp.com/o_1a94vqbnb13l5sj2nu81tr81m887b.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1"
        ];

        titles = ["三大影展获奖影片上映",

        "昆汀有新电影提醒",

        "诺兰新片",

        "索尼新品",

        "大城小店",

        "标准收藏CC新DVD",

        "ZARA打折",

        "火箭队新闻",

        "侯孝贤新电影",

        "Engadget新评测",

        "Google Doodle",

        "iOS人机界面指南更新",

        "短视频推荐",

        "小众软件",

        "上海电影节"
        ];

        self.imageCollectionView.reloadData()
        self.titleCollectionView.reloadData()
    }

}






