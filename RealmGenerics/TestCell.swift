//
//  RealmCell.swift
//  RealmGenerics
//
//  Created by Eugène Peschard on 11/05/2017.
//  Copyright © 2017 PeschApps. All rights reserved.
//

import UIKit
import RealmSwift

class TestCell: UITableViewCell, RealmCell {
  
  typealias Entity = Test // an Object subclass
  
  var object: Entity? {
    didSet {
      updateUI()
    }
  }
  
  func updateUI() {
    if let test = object {
      textLabel?.text = test.name
    }
  }
  
}
