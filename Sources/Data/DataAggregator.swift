//
//  DataAggregator.swift
//  PriviumSDK
//
//  Created by Ryan Napolitano on 8/22/24.
//

// Sources/Data/DataAggregator.swift
import Foundation

public struct DataPoint {
    let timestamp: Date
    let value: Double
}

public class DataAggregator {
    private var dataPoints: [DataPoint] = []

    public init() {}

    public func collectData(value: Double) {
        let dataPoint = DataPoint(timestamp: Date(), value: value)
        dataPoints.append(dataPoint)
    }

    public func aggregateData() -> Double {
        guard !dataPoints.isEmpty else { return 0.0 }
        let sum = dataPoints.reduce(0) { $0 + $1.value }
        return sum / Double(dataPoints.count)
    }

    public func resetData() {
        dataPoints.removeAll()
    }

    public func getData() -> [DataPoint] {
        return dataPoints
    }
}
