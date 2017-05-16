//
//  RealmTableViewController.swift
//  RealmGenerics
//
//  Created by Eugène Peschard on 11/05/2017.
//  Copyright © 2017 PeschApps. All rights reserved.
//

import UIKit
import RealmSwift
import Realm.Dynamic

class RealmTableViewController: UITableViewController {
  
//  @IBInspectable var realmTableViewCellName: String! {
//    didSet {
//      let className = "RealmGenerics.\(realmTableViewCellName)"
////      realmCell = NSClassFromString(className) as! UITableViewCell.Type
//      let cellClass = NSClassFromString(className) as? RealmCell
//      typealias TableCell = cellClass
//    }
//  }
//  
//  var className = "RealmGenerics.TestViewController"
//  var realmCell: UITableViewCell.Type!
//  var realmObject: Object.Type! {
//    didSet {
//      objects = try! Realm().objects(realmObject.self)
//    }
//  }
//  var objects: Results<Object>! {
//    didSet {
//      tableView.reloadData()
//    }
//  }

  
  typealias TableCell = TestCell
  var objects = try! Realm().objects(TableCell.Entity.self) {
    didSet {
      tableView.reloadData()
    }
  }
  
  // MARK: - Run Loop
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if objects.count == 0 {
      let names = ["Anna", "Alex", "Brian", "Jack", "Steve", "Thomas"]
      for name in names {
        let test = Test()
            test.name = name
        do {
          let realm = try Realm()
          try realm.write {
            realm.add(test)
          }
        } catch {
          print(error.localizedDescription)
        }
      }
    }
  }
  
  // MARK: - UITableViewDataSource
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return objects.count
  }
  
  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
      
      let cell =
        tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableCell
      
      cell.object = objects[indexPath.row]
      
      return cell
  }
  
}
