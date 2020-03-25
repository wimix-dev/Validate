import Foundation

public
final class RegexpValidator: Validate {
    public enum ValidatorError: Error {
        case emptyValue
        case notMaching
    }

    public typealias Value = String
    public typealias Failure = ValidatorError

    public let regex: String

    public init(regex: String) {
        self.regex = regex
    }

    public func validate(_ value: String) -> ValidateResult<RegexpValidator.ValidatorError> {
        if value.isEmpty {
            return .failures([.emptyValue])
        }

        if !predicate.evaluate(with: value) {
            return .failures([.notMaching])
        }

        return .success
    }

    private lazy var predicate = { NSPredicate(format: "SELF MATCHES[c] %@", regex) }()
}
