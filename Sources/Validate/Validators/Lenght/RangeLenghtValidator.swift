import Foundation

public struct RangeLenghtValidator<R>: Validate where R: RangeExpression, R.Bound == Int {
    public enum ValidatorError: Error {
        case emptyValue
        case notMaching
    }

    public typealias Value = String
    public typealias Failure = ValidatorError

    public let range: R

    public func validate(_ value: String) -> ValidateResult<RangeLenghtValidator.ValidatorError> {
        if value.isEmpty {
            return .failures([.emptyValue])
        }

        guard range.contains(value.count) else {
            return .failures([.notMaching])
        }

        return .success
    }
}
