import CoreML

public class FederatedLearningModel {
    private var model: MLModel
    private var modelURL: URL

    public init(modelURL: URL) throws {
        self.modelURL = modelURL
        self.model = try MLModel(contentsOf: modelURL)
    }

    public func trainOnDevice(with data: [MLFeatureProvider], completion: @escaping (Result<MLModel, Error>) -> Void) {
        let trainingData = MLArrayBatchProvider(array: data)
        let updateOptions = MLModelConfiguration()

        do {
            // Using MLUpdateTask for on-device training
            let updateTask = try MLUpdateTask(forModelAt: modelURL, trainingData: trainingData, configuration: updateOptions) { context in
                if let error = context.task.error {
                    completion(.failure(error))
                } else {
                    self.model = context.model
                    completion(.success(self.model))
                }
            }
            updateTask.resume()
        } catch {
            completion(.failure(error))
        }
    }

    public func updateGlobalModel(with globalModelURL: URL) throws {
        self.model = try MLModel(contentsOf: globalModelURL)
        self.modelURL = globalModelURL
    }

    public func predict(input: MLFeatureProvider) throws -> MLFeatureProvider {
        return try model.prediction(from: input)
    }
}
