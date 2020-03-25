import Foundation

public
enum ValidateResult<Failure: Error> {
    case success
    case failures([Failure])
}

public
protocol Validate where Self.Failure: Error {
    associatedtype Value
    associatedtype Failure

    func validate(_ value: Value) -> ValidateResult<Failure>
}

public
extension Validate {
    func isValid(_ value: Value) -> Bool {
        switch validate(value) {
        case .success:
            return true
        case .failures:
            return false
        }
    }

    func validate(_ value: Value, completion: (ValidateResult<Failure>) -> Void) {
        let result = validate(value)
        completion(result)
    }
}
