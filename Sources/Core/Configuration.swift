import Foundation
import CryptoKit

public struct PriviumConfiguration {
    public var encryptionKey: SymmetricKey
    public var epsilon: Double
    public var enableDataThrottling: Bool

    public init(encryptionKey: SymmetricKey, epsilon: Double, enableDataThrottling: Bool = true) {
        self.encryptionKey = encryptionKey
        self.epsilon = epsilon
        self.enableDataThrottling = enableDataThrottling
    }
}
