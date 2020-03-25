import Foundation

public
struct DecimalNumberValidator: Validate {
    public enum ValidatorError: Error {
        case empty
        case notMaching
    }

    public typealias Value = String
    public typealias Failure = ValidatorError

    public func validate(_ value: String) -> ValidateResult<DecimalNumberValidator.ValidatorError> {
        if value.isEmpty {
            return .failures([.empty])
        }

        let decimalDigits = CharacterSet.decimalDigits
        var whitespaces = CharacterSet.whitespaces

        if let groupingSeparator = Locale.autoupdatingCurrent.groupingSeparator {
            let grouping = CharacterSet(charactersIn: groupingSeparator)
            whitespaces.formUnion(grouping)
        }

        let decimalSeparator = UnicodeScalar(Locale.autoupdatingCurrent.decimalSeparator!)

        let negativeScalar = UnicodeScalar("-")

        var hasDecimalSeparator = false
        var hasMinus = false

        var hasDigits = false

        for c in value.unicodeScalars {
            if whitespaces.contains(c) {
                continue
            }

            if decimalDigits.contains(c) {
                hasDigits = true
                continue
            }

            if decimalSeparator == c {
                if hasDecimalSeparator || !hasDigits {
                    return .failures([.notMaching])
                } else {
                    hasDecimalSeparator = true
                    continue
                }
            }

            if negativeScalar == c {
                if hasDigits || hasMinus {
                    return .failures([.notMaching])
                } else {
                    hasMinus = true
                    continue
                }
            }

            return .failures([.notMaching])
        }

        return .success
    }
}
