//
//  PriviumSDK.swift
//  PriviumSDK
//
//  Created by Ryan Napolitano on 8/22/24.
//

// Sources/Core/PriviumSDK.swift

import Foundation
import CryptoKit

public class PriviumSDK {
    
    // Singleton instance for global access to the SDK
    public static let shared = PriviumSDK()

    // Configuration object to hold SDK settings
    private var configuration: PriviumConfiguration?
    
    // Private initializer to enforce singleton usage
    private init() {}

    // Method to initialize the SDK with a configuration
    public func initialize(with configuration: PriviumConfiguration) {
        self.configuration = configuration
        Logger.log("PriviumSDK initialized with configuration: \(configuration)")
        setupComponents()
    }

    // Method to track events within the app
    public func trackEvent(_ eventName: String, properties: [String: Any]?) {
        guard let config = configuration else {
            Logger.log("PriviumSDK not initialized. Call initialize(with:) before using the SDK.")
            return
        }

        let dataAggregator = DataAggregator()
        properties?.forEach { key, value in
            if let doubleValue = value as? Double {
                dataAggregator.collectData(value: doubleValue)
            }
        }
        
        let aggregatedData = dataAggregator.aggregateData()
        let encryptor = Encryptor(key: config.encryptionKey)
        if let encryptedData = encryptor.encryptData(Data("\(aggregatedData)".utf8)) {
            Logger.log("Event \(eventName) tracked with encrypted data.")
            sendDataToServer(encryptedData)
        } else {
            Logger.log("Failed to encrypt data for event: \(eventName)")
        }
    }
    
    // Private method to set up SDK components
    private func setupComponents() {
        // Initialize and configure any SDK components that require setup
        Logger.log("PriviumSDK components setup complete.")
    }

    // Private method to send encrypted data to a server
    private func sendDataToServer(_ data: Data) {
        // Replace this with actual server communication code
        // Example: Upload data using URLSession or another networking library
        Logger.log("Encrypted data sent to server.")
    }
}

