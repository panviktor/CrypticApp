//
//  Encrypter.swift
//  CrypticApp
//
//  Created by Viktor on 04.02.2025.
//

import Foundation
import CryptoKit

struct Encrypter {

	private let symmetricKey = SymmetricKey(size: .bits256)

	func encrypt(_ string: String) throws -> (encryptedBase64: String, keyBase64: String) {
		guard let data = string.data(using: .utf8) else {
			throw NSError(
				domain: "EncrypteError",
				code: -1,
				userInfo: [NSLocalizedDescriptionKey: "Failed to encode string to data"]
			)
		}

		let sealedBox = try AES.GCM.seal(data, using: symmetricKey)
		guard let combinedData = sealedBox.combined else {
			throw NSError(
				domain: "EncrypteError",
				code: -1,
				userInfo: [NSLocalizedDescriptionKey: "Failed to obtain combined data from sealed box"]
			)
		}

		let encryptedBase64 = combinedData.base64EncodedString()
		let keyData = symmetricKey.withUnsafeBytes { Data($0) }
		let keyBase64 = keyData.base64EncodedString()

		return (encryptedBase64, keyBase64)
	}
}
