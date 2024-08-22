//
//  Configuration.swift
//  PriviumSDK
//
//  Created by Ryan Napolitano on 8/22/24.
//

// Sources/Core/Configuration.swift
import Foundation

public struct PriviumConfiguration {
    public var encryptionKey: SymmetricKey
    public var epsilon: Double

    public init(encryptionKey: SymmetricKey, epsilon: Double) {
        self.encryptionKey = encryptionKey
        self.epsilon = epsilon
    }
}

