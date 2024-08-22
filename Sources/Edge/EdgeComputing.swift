//
//  EdgeComputing.swift
//  PriviumSDK
//
//  Created by Ryan Napolitano on 8/22/24.
//

// Sources/Edge/EdgeComputing.swift
import Foundation

public class EdgeComputing {
    public init() {}

    public func performComputation(on data: [Double], using operation: (Double) -> Double) -> [Double] {
        return data.map { operation($0) }
    }
}

