import Foundation

public struct MinLenghtValidator: Validate {
    public enum ValidatorError: Error {
        case empty
        case notMaching
    }

    public typealias Value = String
    public typealias Failure = ValidatorError

    public let minLenght: Int

    public func validate(_ value: String) -> ValidateResult<MinLenghtValidator.ValidatorError> {
        if minLenght > 0, value.isEmpty {
            return .failures([.empty])
        }

        guard value.count >= minLenght else {
            return .failures([.notMaching])
        }

        return .success
    }
}
