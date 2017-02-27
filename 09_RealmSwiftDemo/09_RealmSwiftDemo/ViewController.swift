//
//  ViewController.swift
//  09_RealmSwiftDemo
//
//  Created by Fengtf on 2017/2/23.
//  Copyright © 2017年 ftf. All rights reserved.
//

import UIKit
//import Realm
import RealmSwift

class CellModel: Object {
    dynamic var title = ""
    dynamic var date = Date()
}


class ViewController: UITableViewController {


    lazy var dataArray:[CellModel] = [CellModel]()

    var realm = { () -> Realm in
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let dbPath = docPath?.appending("/RRMJ.realm")
        let dbUrl = URL(fileURLWithPath: dbPath!)
        let rm = try! Realm(fileURL: dbUrl)
        return rm
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 70
        print(NSHomeDirectory())

        getAll()
        tableView.reloadData()
    }


    @IBAction func deleteAction() {
        dele()
        getAll()
        tableView.reloadData()
    }

    @IBAction func addAction() {
        add()
        getAll()
        tableView.reloadData()
    }


    func dele(){
        guard let m = self.dataArray.last else{
            return
        }
        let predicate = NSPredicate(format: "title = '\(m.title)'")

        guard let rsm = realm.objects(CellModel.self).filter(predicate).first else {
            return
        }
        realm.beginWrite()

        realm.delete(rsm)

        try! realm.commitWrite()
    }

    func add() {
        realm.beginWrite()
        let m = CellModel()
        let date = Date()
        let inter = date.timeIntervalSince1970
        m.title = "Im China \(inter)"
        m.date = Date()
        realm.add(m)
        try! realm.commitWrite()
    }

    func getAll(){
         let arrs = realm.objects(CellModel.self).sorted(byKeyPath: "date")

        var models = [CellModel]()
        for res in arrs{
            let m = CellModel()
            m.title = res.title
            m.date = res.date
            models.append(m)
        }

        self.dataArray = models
    }
}


extension ViewController{
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        let model = dataArray[indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = "\(model.title)  -  \(model.date)"
        return cell!
    }

}


