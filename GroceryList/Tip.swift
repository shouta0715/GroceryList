//
//  Tip.swift
//  GroceryList
//
//  Created by k21047kk on 2025/01/04.
//

import Foundation
import TipKit

struct ButtonTip: Tip {
  var title: Text = Text("Essential Foods")
  var message: Text? = Text("Add some everyday items to the shopping list.")
  var image: Image? = Image(systemName: "info.circle")
}
