//
//  Item.swift
//  CrypticApp
//
//  Created by Viktor on 04.02.2025.
//

import Foundation
import SwiftData

@Model
final class Item {

    var timestamp: Date
	var originalString: String?
	var encryptedBase64: String?
	var keyBase64: String?

	init(
		timestamp: Date,
		originalString: String? = nil,
		encryptedBase64: String? = nil,
		keyBase64: String? = nil
	) {
		self.timestamp = timestamp
		self.originalString = originalString
		self.encryptedBase64 = encryptedBase64
		self.keyBase64 = keyBase64
	}
}
