//
//  ViewController.swift
//  07_3DTouchDemo
//
//  Created by Fengtf on 2017/2/13.
//  Copyright © 2017年 ftf. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if(self.traitCollection.forceTouchCapability == .available){
            //TODO ...
        }
    }


}

extension ViewController{

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = "item:\(indexPath.item)"
        return cell!
    }


}

