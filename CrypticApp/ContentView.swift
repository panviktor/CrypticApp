//
//  ContentView.swift
//  CrypticApp
//
//  Created by Viktor on 04.02.2025.
//

import SwiftUI
import SwiftData

struct ContentView {

	@Environment(\.modelContext) private var modelContext
	@Query private var items: [Item]

	@State private var showingAlert = false
	@State private var stringToAdd = ""

	private let encrypter = Encrypter()
}

extension ContentView: View  {

	var body: some View {
		NavigationSplitView {
			List {
				ForEach(items) { item in
					NavigationLink {
						ItemDetailView(item: item)
					} label: {
						Text(item.originalString ?? "")
							.font(.callout)
					}
				}
				.onDelete(perform: deleteItems)
			}
#if os(macOS)
			.navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
			.toolbar {
#if os(iOS)
				ToolbarItem(placement: .navigationBarTrailing) {
					EditButton()
				}
#endif
				ToolbarItem {
					Button(action: {
						showingAlert = true
					}) {
						Label("Add Item", systemImage: "plus")
					}
				}
			}

			.alert("String to encrypt", isPresented: $showingAlert) {
				TextField("Enter", text: $stringToAdd)
				Button("OK", action: addItem)
			}

		} detail: {
			Text("Select an item")
		}
	}
}

private extension ContentView {

	func addItem() {
		 withAnimation {
			 do {
				 let (encryptedBase64, keyBase64) = try encrypter.encrypt(stringToAdd)
				 let newItem = Item(
					 timestamp: Date(),
					 originalString: stringToAdd,
					 encryptedBase64: encryptedBase64,
					 keyBase64: keyBase64
				 )
				 modelContext.insert(newItem)
				 try modelContext.save()
				 self.stringToAdd = ""
			 } catch {
				 print("Error encrypting string: \(error)")
			 }
		 }
	 }

	func deleteItems(offsets: IndexSet) {
		withAnimation {
			for index in offsets {
				modelContext.delete(items[index])
			}
		}
	}
}

#Preview {
	ContentView()
		.modelContainer(for: Item.self, inMemory: true)
}
