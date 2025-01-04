//
//  Item.swift
//  GroceryList
//
//  Created by k21047kk on 2025/01/04.
//

import Foundation
import SwiftData

@Model
class Item {
  var title:String
  var isCompleted:Bool
  
  init(title:String, isCompleted:Bool) {
    self.title = title
    self.isCompleted = isCompleted
  }
}
