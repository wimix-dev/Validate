import Foundation

public struct MinMaxLenghtValidator: Validate {
    public enum ValidatorError: Error {
        case empty
        case tooShort(minLenght: Int)
        case tooLong(maxLenght: Int)
    }

    public typealias Value = String
    public typealias Failure = ValidatorError

    public let minLenght: Int
    public let maxLenght: Int

    public func validate(_ value: String) -> ValidateResult<MinMaxLenghtValidator.ValidatorError> {
        if minLenght > 0, value.isEmpty {
            return .failures([.empty])
        }

        guard value.count >= minLenght else {
            return .failures([.tooShort(minLenght: minLenght)])
        }

        guard value.count <= maxLenght else {
            return .failures([.tooLong(maxLenght: maxLenght)])
        }

        return .success
    }
}
