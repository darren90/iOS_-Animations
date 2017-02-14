//
//  LikeViewController.swift
//  07_3DTouchDemo
//
//  Created by Fengtf on 2017/2/14.
//  Copyright © 2017年 ftf. All rights reserved.
//

import UIKit

class LikeViewController: UITableViewController {

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
        var cell = tableView.dequeueReusableCell(withIdentifier: "like")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "like")
        }
        cell?.textLabel?.text = " like -- row : \(indexPath.row)"

        return cell!
    }


}
