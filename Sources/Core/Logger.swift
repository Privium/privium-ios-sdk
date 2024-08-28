import Foundation

public class Logger {
    public static func log(_ message: String) {
        #if DEBUG
        print("[PriviumSDK] \(message)")
        #endif
    }
}
