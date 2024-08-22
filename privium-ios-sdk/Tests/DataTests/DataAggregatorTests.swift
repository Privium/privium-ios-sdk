//
//  DataAggregatorTests.swift
//  PriviumSDKTests
//
//  Created by Ryan Napolitano on 8/22/24.
//

// Tests/DataTests/DataAggregatorTests.swift
import XCTest
@testable import PriviumSDK

class DataAggregatorTests: XCTestCase {
    func testAggregation() {
        let aggregator = DataAggregator()
        aggregator.collectData(value: 10.0)
        aggregator.collectData(value: 20.0)
        let aggregated = aggregator.aggregateData()
        XCTAssertEqual(aggregated, 15.0)
    }

    func testReset() {
        let aggregator = DataAggregator()
        aggregator.collectData(value: 10.0)
        aggregator.resetData()
        XCTAssertEqual(aggregator.getData().count, 0)
    }
}

