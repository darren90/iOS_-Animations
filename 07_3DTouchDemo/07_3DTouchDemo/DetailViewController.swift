//
//  DetailViewController.swift
//  07_3DTouchDemo
//
//  Created by Fengtf on 2017/2/14.
//  Copyright © 2017年 ftf. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {


    var mTitle: String?

    override var previewActionItems: [UIPreviewActionItem] {

        let a1 = UIPreviewAction(title: "在新标签中打开", style: .default, handler: { (action, vc) in
            print(action.title)
        })
        let a2 = UIPreviewAction(title: "加入阅读列表", style: .selected, handler: { (action, vc) in
            print(action.title)
        })
        let a31 = UIPreviewAction(title: "拷贝", style: .default, handler: { (action, vc) in
            print(action.title)
        })
        let a32 = UIPreviewAction(title: "收藏", style: .default, handler: { (action, vc) in
            print(action.title)
        })
        let a3 = UIPreviewActionGroup(title: "共享&更多...", style: .default, actions: [a31,a32])

        return [a1,a2,a3]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell2")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell2")
        }
        cell?.textLabel?.text = "\(mTitle ?? "title")  is row : \(indexPath.row)"

        return cell!
    }



}






