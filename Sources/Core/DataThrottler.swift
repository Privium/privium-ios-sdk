import Foundation

public class DataThrottler {
    private var lastSentTimestamp: Date?
    
    public init() {}

    public func throttleIfNeeded() {
        let now = Date()
        if let lastSent = lastSentTimestamp, now.timeIntervalSince(lastSent) < 60 {
            Logger.log("Throttling data collection to optimize performance.")
            return
        }
        lastSentTimestamp = now
    }
}
