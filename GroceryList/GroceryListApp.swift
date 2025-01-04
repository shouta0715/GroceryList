//
//  GroceryListApp.swift
//  GroceryList
//
//  Created by k21047kk on 2025/01/04.
//

import SwiftUI
import SwiftData


@main
struct GroceryListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .modelContainer(for: Item.self)
        }
    }
}
