//
//  RealmTableCell.swift
//  RealmGenerics
//
//  Created by Eugène Peschard on 12/05/2017.
//  Copyright © 2017 PeschApps. All rights reserved.
//

import RealmSwift

protocol RealmCell {
  
  associatedtype Entity: Object
  
  var object: Entity? { get set }
  
  func updateUI()
  
}
