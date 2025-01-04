//
//  ContentView.swift
//  GroceryList
//
//  Created by k21047kk on 2025/01/04.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var items: [Item]
  
  func addEssentialFoods() {
    modelContext.insert(Item(title: "Apples", isCompleted: false))
    modelContext.insert(Item(title: "Bananas", isCompleted: false))
    modelContext.insert(Item(title: "Oranges", isCompleted: true))
    modelContext.insert(Item(title: "Pears", isCompleted: false))
    modelContext.insert(Item(title: "Grapes", isCompleted: true))
    modelContext.insert(Item(title: "Apples", isCompleted: false))
  }
  
    var body: some View {
      NavigationStack {
        List {
          ForEach(items) { item in
            Text(item.title)
              .font(.title.weight(.light))
              .padding(.vertical, 2)
              .foregroundStyle(
                item.isCompleted ? Color.accentColor : Color.primary
              )
              .strikethrough(item.isCompleted)
              .italic(item.isCompleted)
              .swipeActions {
                Button(role: .destructive) {
                  withAnimation {
                    modelContext.delete(item)
                  }
                } label: {
                  Label("Delete", systemImage: "trash")
                }
              }
              .swipeActions(edge: .leading) {
                Button (
                  "Done",
                  systemImage: item.isCompleted ? "x.circle" :   "checkmark.circle"
                ) {
                  item.isCompleted.toggle()
                }
                .tint(item.isCompleted ? .red : .green)
              }
            
          }
        }
        .navigationTitle("Grocery List")
        .toolbar {
          if items.isEmpty {
            ToolbarItem(placement: .topBarTrailing) {
              Button {
                addEssentialFoods()
              } label: {
                Label("Add Essential Foods", systemImage: "carrot")
              }
            }
          }
        }
        .overlay {
          if items.isEmpty {
            ContentUnavailableView(
              "Empty Cart",
              systemImage: "cart.circle",
              description: Text(
                "Add some items to the shopping list."
              )
            )
          }
        }
      }
    }
}

#Preview("Sample Data") {
  
  let sampleData: [Item] = [
    Item(title: "Apples", isCompleted: false),
    Item(title: "Bananas", isCompleted: false),
    Item(title: "Oranges", isCompleted: true),
    Item(title: "Pears", isCompleted: false),
    Item(title: "Grapes", isCompleted: false),
  ]
  
  
  
  let container = try! ModelContainer(
    for: Item.self,
    configurations: ModelConfiguration(isStoredInMemoryOnly: true)
  )
  
  for item in sampleData {
    container.mainContext.insert(item)
  }
  
  return ContentView()
    .modelContainer(container)
}


#Preview("Empty View") {
    ContentView()
    .modelContainer(for: Item.self,inMemory: true)
}
