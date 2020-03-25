import Foundation

public struct MaxLenghtValidator: Validate {
    public enum ValidatorError: Error {
        case notMaching
    }

    public typealias Value = String
    public typealias Failure = ValidatorError

    public let maxLenght: Int

    public func validate(_ value: String) -> ValidateResult<MaxLenghtValidator.ValidatorError> {
        guard value.count <= maxLenght else {
            return .failures([.notMaching])
        }

        return .success
    }
}
