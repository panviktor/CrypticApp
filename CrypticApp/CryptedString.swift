//
//  CryptedString.swift
//  CrypticApp
//
//  Created by Viktor on 04.02.2025.
//

import Foundation
import CryptoKit

@propertyWrapper
struct CryptedString {
	// Encrypted value and decryption key, both stored as Base64 strings.
	private let encryptedBase64: String
	private let keyBase64: String

	// Cache the decrypted value so that decryption only happens once.
	private var decryptedCache: String?

	init(base: String, key: String) {
		self.encryptedBase64 = base
		self.keyBase64 = key
	}

	// When the wrapped property is accessed, perform the decryption.
	var wrappedValue: String? {
		mutating get {
			// If already decrypted, return the cached value.
			if let cached = decryptedCache {
				return cached
			}

			// Convert the stored Base64 strings into Data.
			guard let combinedData = Data(base64Encoded: encryptedBase64),
				  let keyData = Data(base64Encoded: keyBase64) else {
				print("Invalid Base64 encoding for either the encrypted data or key.")
				return nil
			}

			// Create the symmetric key from the key data.
			let symmetricKey = SymmetricKey(data: keyData)
			do {
				// Reconstruct the sealed box (which contains the nonce, ciphertext, and tag).
				let sealedBox = try AES.GCM.SealedBox(combined: combinedData)
				// Decrypt the data.
				let decryptedData = try AES.GCM.open(sealedBox, using: symmetricKey)
				// Convert decrypted data back to a string.
				guard let decryptedString = String(data: decryptedData, encoding: .utf8) else {
					print("Failed to decode decrypted data into a UTF-8 string.")
					return nil
				}
				// Cache and return the result.
				decryptedCache = decryptedString
				return decryptedString
			} catch {
				print("Decryption error: \(error)")
				return nil
			}
		}
	}
}
