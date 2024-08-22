//
//  FederatedLearningModel.swift
//  PriviumSDK
//
//  Created by Ryan Napolitano on 8/22/24.
//

// Sources/Learning/FederatedLearning.swift
import CoreML

public class FederatedLearningModel {
    private var model: MLModel

    public init(modelURL: URL) throws {
        self.model = try MLModel(contentsOf: modelURL)
    }

    public func trainOnDevice(with data: [MLFeatureProvider]) throws {
        let trainingData = MLArrayBatchProvider(array: data)
        let updateOptions = MLModelConfiguration()
        let trainedModel = try model.updating(on: trainingData, configuration: updateOptions)
        self.model = trainedModel
    }

    public func updateGlobalModel(with globalModelURL: URL) throws {
        let globalModel = try MLModel(contentsOf: globalModelURL)
        self.model = globalModel
    }

    public func predict(input: MLFeatureProvider) throws -> MLFeatureProvider {
        return try model.prediction(from: input)
    }
}

