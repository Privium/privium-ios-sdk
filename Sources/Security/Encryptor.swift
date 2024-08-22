//
//  Encryptor.swift
//  PriviumSDK
//
//  Created by Ryan Napolitano on 8/22/24.
//

// Sources/Security/Encryptor.swift
import Foundation
import CryptoKit

public class Encryptor {
    private let key: SymmetricKey

    public init(key: SymmetricKey) {
        self.key = key
    }

    public func encryptData(_ data: Data) -> Data? {
        do {
            let sealedBox = try AES.GCM.seal(data, using: key)
            return sealedBox.combined
        } catch {
            Logger.log("Encryption failed: \(error)")
            return nil
        }
    }

    public func decryptData(_ encryptedData: Data) -> Data? {
        do {
            let sealedBox = try AES.GCM.SealedBox(combined: encryptedData)
            let decryptedData = try AES.GCM.open(sealedBox, using: key)
            return decryptedData
        } catch {
            Logger.log("Decryption failed: \(error)")
            return nil
        }
    }
}

