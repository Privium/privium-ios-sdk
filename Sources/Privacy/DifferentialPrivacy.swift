import Foundation

public class DifferentialPrivacy {
    private let epsilon: Double

    public init(epsilon: Double) {
        self.epsilon = epsilon
    }

    public func applyNoise(to data: Double) -> Double {
        let noise = Double.random(in: -epsilon...epsilon)
        return data + noise
    }

    public func anonymizeDataset(_ dataset: [Double]) -> [Double] {
        return dataset.map { applyNoise(to: $0) }
    }
}
