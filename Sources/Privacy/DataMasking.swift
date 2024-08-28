import Foundation

public class DataMasking {
    public static func maskData(_ data: [String: Any], maskRules: [String: (Any) -> Any]) -> [String: Any] {
        var maskedData = data
        for (key, rule) in maskRules {
            if let value = data[key] {
                maskedData[key] = rule(value)
            }
        }
        return maskedData
    }
}
