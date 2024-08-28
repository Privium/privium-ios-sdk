//
//  DataAggregatorTests.swift
//  PriviumSDKTests
//
//  Created by Ryan Napolitano on 8/22/24.
//

import XCTest
@testable import PriviumSDK

class DataAggregatorTests: XCTestCase {

    // Test aggregation functionality
    func testAggregation() {
        let aggregator = DataAggregator()
        aggregator.collectData(value: 10.0)
        aggregator.collectData(value: 20.0)
        let aggregated = aggregator.aggregateData()
        XCTAssertEqual(aggregated, 15.0, "The aggregated value should be the average of collected values.")
    }

    // Test resetting the data aggregator
    func testReset() {
        let aggregator = DataAggregator()
        aggregator.collectData(value: 10.0)
        aggregator.resetData()
        XCTAssertEqual(aggregator.getData().count, 0, "Data count should be 0 after reset.")
    }

    // Test collecting multiple data points
    func testMultipleDataPoints() {
        let aggregator = DataAggregator()
        aggregator.collectData(value: 5.0)
        aggregator.collectData(value: 15.0)
        aggregator.collectData(value: 25.0)
        let aggregated = aggregator.aggregateData()
        XCTAssertEqual(aggregated, 15.0, "The aggregated value should be the average of collected values.")
    }

    // Test aggregation with no data points
    func testAggregationWithNoData() {
        let aggregator = DataAggregator()
        let aggregated = aggregator.aggregateData()
        XCTAssertEqual(aggregated, 0.0, "The aggregated value should be 0 when no data points are collected.")
    }

    // Test data retrieval after multiple collections
    func testGetData() {
        let aggregator = DataAggregator()
        aggregator.collectData(value: 10.0)
        aggregator.collectData(value: 20.0)
        let dataPoints = aggregator.getData()
        XCTAssertEqual(dataPoints.count, 2, "Data points count should match the number of collections.")
        XCTAssertEqual(dataPoints[0].value, 10.0, "The first data point value should be 10.0.")
        XCTAssertEqual(dataPoints[1].value, 20.0, "The second data point value should be 20.0.")
    }

    // Test resetting the data aggregator after multiple collections
    func testResetAfterMultipleCollections() {
        let aggregator = DataAggregator()
        aggregator.collectData(value: 10.0)
        aggregator.collectData(value: 20.0)
        aggregator.resetData()
        XCTAssertEqual(aggregator.getData().count, 0, "Data count should be 0 after reset, even with multiple collections.")
    }

    // Test aggregation with identical data points
    func testAggregationWithIdenticalDataPoints() {
        let aggregator = DataAggregator()
        aggregator.collectData(value: 10.0)
        aggregator.collectData(value: 10.0)
        let aggregated = aggregator.aggregateData()
        XCTAssertEqual(aggregated, 10.0, "The aggregated value should be equal to the identical data points.")
    }
}
