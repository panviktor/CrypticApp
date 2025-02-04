//
//  ItemDetailView.swift
//  CrypticApp
//
//  Created by Viktor on 04.02.2025.
//

import SwiftUI

struct ItemDetailView: View {
    let item: Item

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            sectionView(title: "Original", text: item.originalString)
            sectionView(title: "Encrypted Base64", text: item.encryptedBase64)
			sectionView(title: "Key Base64", text: item.keyBase64)

            Spacer()
        }
        .padding()
        .navigationTitle("Item Details")
    }
    
    @ViewBuilder
    private func sectionView(title: String, text: String?) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(title + ":")
                    .font(.headline)
                Spacer()
                Button(action: {
                    copyToClipboard(text)
                }) {
                    Image(systemName: "doc.on.doc")
                        .foregroundColor(.blue)
                }
            }
            Text(text ?? "N/A")
                .font(.body)
                .padding(8)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
        }
    }
    
    private func copyToClipboard(_ text: String?) {
        guard let text = text else { return }
        UIPasteboard.general.string = text
    }
}
