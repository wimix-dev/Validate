import Foundation

public
struct EmailValidator: Validate {
    public enum ValidatorError: Error {
        case emptyValue
        case tooShort
        case tooLong
        case notMaching
    }

    public typealias Value = String
    public typealias Failure = ValidatorError

    public func validate(_ value: String) -> ValidateResult<EmailValidator.ValidatorError> {
        if value.isEmpty {
            return .failures([.emptyValue])
        }

        guard value.count > 5 else {
            return .failures([.tooShort])
        }

        guard value.count < 255 else {
            return .failures([.tooLong])
        }

        guard value.contains("@"), emailPredicate.evaluate(with: value) else {
            return .failures([.notMaching])
        }

        return .success
    }
}

private let emailPredicate = { NSPredicate(format: "SELF MATCHES[c] %@", regexp) }()

private let regexp = #"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])"#
