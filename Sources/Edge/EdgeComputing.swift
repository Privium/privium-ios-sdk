import Foundation

public class EdgeComputing {
    public init() {}

    public func performComputation(on data: [Double], using operation: (Double) -> Double) -> [Double] {
        return data.map { operation($0) }
    }
}
