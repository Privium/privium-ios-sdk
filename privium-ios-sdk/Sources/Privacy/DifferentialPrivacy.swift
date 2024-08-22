//
//  DifferentialPrivacy.swift
//  PriviumSDK
//
//  Created by Ryan Napolitano on 8/22/24.
//

// Sources/Privacy/DifferentialPrivacy.swift
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

