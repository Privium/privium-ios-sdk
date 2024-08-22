// Sources/Core/PriviumSDK.swift
import Foundation
import CryptoKit

public class PriviumSDK {
    
    public static let shared = PriviumSDK()
    private var configuration: PriviumConfiguration?

    private init() {}

    public func initialize(with configuration: PriviumConfiguration) {
        self.configuration = configuration
        Logger.log("PriviumSDK initialized with configuration: \(configuration)")
        setupComponents()
    }

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
    
    private func setupComponents() {
        Logger.log("PriviumSDK components setup complete.")
    }

    private func sendDataToServer(_ data: Data) {
        // Replace with actual server communication logic
        Logger.log("Encrypted data sent to server.")
    }
}
