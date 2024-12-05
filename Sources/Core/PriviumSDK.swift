import Foundation
import CryptoKit

public class PriviumSDK {
    
    public static let shared = PriviumSDK()
    private var configuration: PriviumConfiguration?
    private var throttler: DataThrottler?
    
    private var baseURL: String
    
    private init() {
        self.baseURL = ""
    }

    public func initialize(with configuration: PriviumConfiguration, baseURL: String) {
        self.configuration = configuration
        self.baseURL = baseURL
        Logger.log("PriviumSDK initialized with configuration: \(configuration) and baseURL: \(baseURL)")
        setupComponents()
    }

    public func trackEvent(_ eventName: String, properties: [String: Any]?) {
        guard let config = configuration else {
            Logger.log("PriviumSDK not initialized. Call initialize(with:) before using the SDK.")
            return
        }

        throttler?.throttleIfNeeded()
        
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
            sendDataToServer(eventName: eventName, data: encryptedData)
        } else {
            Logger.log("Failed to encrypt data for event: \(eventName)")
        }
    }

    private func setupComponents() {
        if let config = configuration, config.enableDataThrottling {
            throttler = DataThrottler()
        }
        Logger.log("PriviumSDK components setup complete.")
    }

    private func sendDataToServer(eventName: String, data: Data) {
        guard let url = URL(string: "\(baseURL)/api/data/collect") else {
            Logger.log("Invalid URL for sending data.")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // Include proper authorization if necessary
        request.httpBody = data
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                Logger.log("Failed to send data: \(error)")
                return
            }
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                Logger.log("Data sent successfully.")
            } else {
                Logger.log("Failed to send data, server returned: \(response.debugDescription)")
            }
        }
        task.resume()
    }
}
