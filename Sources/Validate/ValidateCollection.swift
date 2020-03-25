import Foundation

public
struct ValidateCollection<Value, Failure: Error>: Validate {
    private let validators: [AnyValidate<Value, Failure>]

    public func validate(_ value: Value) -> ValidateResult<Failure> {
        var failures = [Failure]()

        var failed = false
        for validator in validators {
            switch validator.validate(value) {
            case .success:
                continue
            case let .failures(errors):
                failed = true
                failures.append(contentsOf: errors)
            }
        }

        if failed {
            return .failures(failures)
        }

        return .success
    }

    public
    init<V: Validate>(_ v: V) where V.Value == Value, V.Failure == Failure {
        validators = [v.anyValidator]
    }

    public
    init<V: Validate, V0: Validate>(_ v: V, _ v0: V0) where
        V.Value == Value, V.Failure == Failure,
        V0.Value == Value, V0.Failure == Failure {
        validators = [v.anyValidator,
                      v0.anyValidator]
    }

    public
    init<V: Validate, V0: Validate, V1: Validate>(_ v: V, _ v0: V0, _ v1: V1) where
        V.Value == Value, V.Failure == Failure,
        V0.Value == Value, V0.Failure == Failure,
        V1.Value == Value, V1.Failure == Failure {
        validators = [v.anyValidator,
                      v0.anyValidator,
                      v1.anyValidator]
    }

    public
    init<V: Validate, V0: Validate, V1: Validate, V2: Validate>(_ v: V, _ v0: V0, _ v1: V1, _ v2: V2) where
        V.Value == Value, V.Failure == Failure,
        V0.Value == Value, V0.Failure == Failure,
        V1.Value == Value, V1.Failure == Failure,
        V2.Value == Value, V2.Failure == Failure {
        validators = [v.anyValidator,
                      v0.anyValidator,
                      v1.anyValidator,
                      v2.anyValidator]
    }

    public
    init<V: Validate, V0: Validate, V1: Validate, V2: Validate, V3: Validate>(_ v: V, _ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3) where
        V.Value == Value, V.Failure == Failure,
        V0.Value == Value, V0.Failure == Failure,
        V1.Value == Value, V1.Failure == Failure,
        V2.Value == Value, V2.Failure == Failure,
        V3.Value == Value, V3.Failure == Failure {
        validators = [v.anyValidator,
                      v0.anyValidator,
                      v1.anyValidator,
                      v2.anyValidator,
                      v3.anyValidator]
    }

    public
    init<V: Validate, V0: Validate, V1: Validate, V2: Validate, V3: Validate, V4: Validate>(_ v: V, _ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4) where
        V.Value == Value, V.Failure == Failure,
        V0.Value == Value, V0.Failure == Failure,
        V1.Value == Value, V1.Failure == Failure,
        V2.Value == Value, V2.Failure == Failure,
        V3.Value == Value, V3.Failure == Failure,
        V4.Value == Value, V4.Failure == Failure {
        validators = [v.anyValidator,
                      v0.anyValidator,
                      v1.anyValidator,
                      v2.anyValidator,
                      v3.anyValidator,
                      v4.anyValidator]
    }

    public
    init<V: Validate, V0: Validate, V1: Validate,
         V2: Validate, V3: Validate, V4: Validate,
         V5: Validate>(_ v: V, _ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5) where
        V.Value == Value, V.Failure == Failure,
        V0.Value == Value, V0.Failure == Failure,
        V1.Value == Value, V1.Failure == Failure,
        V2.Value == Value, V2.Failure == Failure,
        V3.Value == Value, V3.Failure == Failure,
        V4.Value == Value, V4.Failure == Failure,
        V5.Value == Value, V5.Failure == Failure {
        validators = [v.anyValidator,
                      v0.anyValidator,
                      v1.anyValidator,
                      v2.anyValidator,
                      v3.anyValidator,
                      v4.anyValidator,
                      v5.anyValidator]
    }

    public
    init<V: Validate, V0: Validate, V1: Validate,
         V2: Validate, V3: Validate, V4: Validate,
         V5: Validate, V6: Validate>(_ v: V, _ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5, _ v6: V6) where
        V.Value == Value, V.Failure == Failure,
        V0.Value == Value, V0.Failure == Failure,
        V1.Value == Value, V1.Failure == Failure,
        V2.Value == Value, V2.Failure == Failure,
        V3.Value == Value, V3.Failure == Failure,
        V4.Value == Value, V4.Failure == Failure,
        V5.Value == Value, V5.Failure == Failure,
        V6.Value == Value, V6.Failure == Failure {
        validators = [v.anyValidator,
                      v0.anyValidator,
                      v1.anyValidator,
                      v2.anyValidator,
                      v3.anyValidator,
                      v4.anyValidator,
                      v5.anyValidator,
                      v6.anyValidator]
    }

    public
    init<V: Validate, V0: Validate, V1: Validate,
         V2: Validate, V3: Validate, V4: Validate,
         V5: Validate, V6: Validate, V7: Validate>(_ v: V, _ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5, _ v6: V6, _ v7: V7) where
        V.Value == Value, V.Failure == Failure,
        V0.Value == Value, V0.Failure == Failure,
        V1.Value == Value, V1.Failure == Failure,
        V2.Value == Value, V2.Failure == Failure,
        V3.Value == Value, V3.Failure == Failure,
        V4.Value == Value, V4.Failure == Failure,
        V5.Value == Value, V5.Failure == Failure,
        V6.Value == Value, V6.Failure == Failure,
        V7.Value == Value, V7.Failure == Failure {
        validators = [v.anyValidator,
                      v0.anyValidator,
                      v1.anyValidator,
                      v2.anyValidator,
                      v3.anyValidator,
                      v4.anyValidator,
                      v5.anyValidator,
                      v6.anyValidator,
                      v7.anyValidator]
    }

    public
    init<V: Validate, V0: Validate, V1: Validate,
         V2: Validate, V3: Validate, V4: Validate,
         V5: Validate, V6: Validate, V7: Validate,
         V8: Validate>(_ v: V, _ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5, _ v6: V6, _ v7: V7, _ v8: V8) where
        V.Value == Value, V.Failure == Failure,
        V0.Value == Value, V0.Failure == Failure,
        V1.Value == Value, V1.Failure == Failure,
        V2.Value == Value, V2.Failure == Failure,
        V3.Value == Value, V3.Failure == Failure,
        V4.Value == Value, V4.Failure == Failure,
        V5.Value == Value, V5.Failure == Failure,
        V6.Value == Value, V6.Failure == Failure,
        V7.Value == Value, V7.Failure == Failure,
        V8.Value == Value, V8.Failure == Failure {
        validators = [v.anyValidator,
                      v0.anyValidator,
                      v1.anyValidator,
                      v2.anyValidator,
                      v3.anyValidator,
                      v4.anyValidator,
                      v5.anyValidator,
                      v6.anyValidator,
                      v7.anyValidator,
                      v8.anyValidator]
    }

    public
    init<V: Validate, V0: Validate, V1: Validate,
         V2: Validate, V3: Validate, V4: Validate,
         V5: Validate, V6: Validate, V7: Validate,
         V8: Validate, V9: Validate>(_ v: V, _ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5, _ v6: V6, _ v7: V7, _ v8: V8, _ v9: V9) where
        V.Value == Value, V.Failure == Failure,
        V0.Value == Value, V0.Failure == Failure,
        V1.Value == Value, V1.Failure == Failure,
        V2.Value == Value, V2.Failure == Failure,
        V3.Value == Value, V3.Failure == Failure,
        V4.Value == Value, V4.Failure == Failure,
        V5.Value == Value, V5.Failure == Failure,
        V6.Value == Value, V6.Failure == Failure,
        V7.Value == Value, V7.Failure == Failure,
        V8.Value == Value, V8.Failure == Failure,
        V9.Value == Value, V9.Failure == Failure {
        validators = [v.anyValidator,
                      v0.anyValidator,
                      v1.anyValidator,
                      v2.anyValidator,
                      v3.anyValidator,
                      v4.anyValidator,
                      v5.anyValidator,
                      v6.anyValidator,
                      v7.anyValidator,
                      v8.anyValidator,
                      v9.anyValidator]
    }

    public
    init<V: Validate, V0: Validate, V1: Validate,
         V2: Validate, V3: Validate, V4: Validate,
         V5: Validate, V6: Validate, V7: Validate,
         V8: Validate, V9: Validate, V10: Validate>(_ v: V, _ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5, _ v6: V6, _ v7: V7, _ v8: V8, _ v9: V9, _ v10: V10) where
        V.Value == Value, V.Failure == Failure,
        V0.Value == Value, V0.Failure == Failure,
        V1.Value == Value, V1.Failure == Failure,
        V2.Value == Value, V2.Failure == Failure,
        V3.Value == Value, V3.Failure == Failure,
        V4.Value == Value, V4.Failure == Failure,
        V5.Value == Value, V5.Failure == Failure,
        V6.Value == Value, V6.Failure == Failure,
        V7.Value == Value, V7.Failure == Failure,
        V8.Value == Value, V8.Failure == Failure,
        V9.Value == Value, V9.Failure == Failure,
        V10.Value == Value, V10.Failure == Failure {
        validators = [v.anyValidator,
                      v0.anyValidator,
                      v1.anyValidator,
                      v2.anyValidator,
                      v3.anyValidator,
                      v4.anyValidator,
                      v5.anyValidator,
                      v6.anyValidator,
                      v7.anyValidator,
                      v8.anyValidator,
                      v9.anyValidator,
                      v10.anyValidator]
    }

    public
    init<V: Validate, V0: Validate, V1: Validate,
         V2: Validate, V3: Validate, V4: Validate,
         V5: Validate, V6: Validate, V7: Validate,
         V8: Validate, V9: Validate, V10: Validate,
         V11: Validate>(_ v: V, _ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5, _ v6: V6, _ v7: V7, _ v8: V8, _ v9: V9, _ v10: V10, _ v11: V11) where
        V.Value == Value, V.Failure == Failure,
        V0.Value == Value, V0.Failure == Failure,
        V1.Value == Value, V1.Failure == Failure,
        V2.Value == Value, V2.Failure == Failure,
        V3.Value == Value, V3.Failure == Failure,
        V4.Value == Value, V4.Failure == Failure,
        V5.Value == Value, V5.Failure == Failure,
        V6.Value == Value, V6.Failure == Failure,
        V7.Value == Value, V7.Failure == Failure,
        V8.Value == Value, V8.Failure == Failure,
        V9.Value == Value, V9.Failure == Failure,
        V10.Value == Value, V10.Failure == Failure,
        V11.Value == Value, V11.Failure == Failure {
        validators = [v.anyValidator,
                      v0.anyValidator,
                      v1.anyValidator,
                      v2.anyValidator,
                      v3.anyValidator,
                      v4.anyValidator,
                      v5.anyValidator,
                      v6.anyValidator,
                      v7.anyValidator,
                      v8.anyValidator,
                      v9.anyValidator,
                      v10.anyValidator,
                      v11.anyValidator]
    }

    public
    init<V: Validate, V0: Validate, V1: Validate,
         V2: Validate, V3: Validate, V4: Validate,
         V5: Validate, V6: Validate, V7: Validate,
         V8: Validate, V9: Validate, V10: Validate,
         V11: Validate, V12: Validate>(_ v: V, _ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5, _ v6: V6, _ v7: V7, _ v8: V8, _ v9: V9, _ v10: V10, _ v11: V11, _ v12: V12) where
        V.Value == Value, V.Failure == Failure,
        V0.Value == Value, V0.Failure == Failure,
        V1.Value == Value, V1.Failure == Failure,
        V2.Value == Value, V2.Failure == Failure,
        V3.Value == Value, V3.Failure == Failure,
        V4.Value == Value, V4.Failure == Failure,
        V5.Value == Value, V5.Failure == Failure,
        V6.Value == Value, V6.Failure == Failure,
        V7.Value == Value, V7.Failure == Failure,
        V8.Value == Value, V8.Failure == Failure,
        V9.Value == Value, V9.Failure == Failure,
        V10.Value == Value, V10.Failure == Failure,
        V11.Value == Value, V11.Failure == Failure,
        V12.Value == Value, V12.Failure == Failure {
        validators = [v.anyValidator,
                      v0.anyValidator,
                      v1.anyValidator,
                      v2.anyValidator,
                      v3.anyValidator,
                      v4.anyValidator,
                      v5.anyValidator,
                      v6.anyValidator,
                      v7.anyValidator,
                      v8.anyValidator,
                      v9.anyValidator,
                      v10.anyValidator,
                      v11.anyValidator,
                      v12.anyValidator]
    }

    public
    init<V: Validate, V0: Validate, V1: Validate,
         V2: Validate, V3: Validate, V4: Validate,
         V5: Validate, V6: Validate, V7: Validate,
         V8: Validate, V9: Validate, V10: Validate,
         V11: Validate, V12: Validate, V13: Validate>(_ v: V, _ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5, _ v6: V6, _ v7: V7, _ v8: V8, _ v9: V9, _ v10: V10, _ v11: V11, _ v12: V12, _ v13: V13) where
        V.Value == Value, V.Failure == Failure,
        V0.Value == Value, V0.Failure == Failure,
        V1.Value == Value, V1.Failure == Failure,
        V2.Value == Value, V2.Failure == Failure,
        V3.Value == Value, V3.Failure == Failure,
        V4.Value == Value, V4.Failure == Failure,
        V5.Value == Value, V5.Failure == Failure,
        V6.Value == Value, V6.Failure == Failure,
        V7.Value == Value, V7.Failure == Failure,
        V8.Value == Value, V8.Failure == Failure,
        V9.Value == Value, V9.Failure == Failure,
        V10.Value == Value, V10.Failure == Failure,
        V11.Value == Value, V11.Failure == Failure,
        V12.Value == Value, V12.Failure == Failure,
        V13.Value == Value, V13.Failure == Failure {
        validators = [v.anyValidator,
                      v0.anyValidator,
                      v1.anyValidator,
                      v2.anyValidator,
                      v3.anyValidator,
                      v4.anyValidator,
                      v5.anyValidator,
                      v6.anyValidator,
                      v7.anyValidator,
                      v8.anyValidator,
                      v9.anyValidator,
                      v10.anyValidator,
                      v11.anyValidator,
                      v12.anyValidator,
                      v13.anyValidator]
    }
}

private
extension Validate {
    var anyValidator: AnyValidate<Value, Failure> {
        AnyValidate(validator: self)
    }
}

private
struct AnyValidate<Value, Failure: Error>: Validate {
    private let validator: ValidateBox<Value, Failure>

    public init<V: Validate>(validator: V) where V.Value == Value, V.Failure == Failure {
        self.validator = ValidateBoxHelper(validator: validator)
    }

    public func validate(_ value: Value) -> ValidateResult<Failure> {
        validator.validate(value)
    }
}

private
class ValidateBox<BoxValue, BoxFailure: Error>: Validate {
    typealias Value = BoxValue
    typealias Failure = BoxFailure

    func validate(_: BoxValue) -> ValidateResult<BoxFailure> {
        fatalError()
    }
}

private
class ValidateBoxHelper<V: Validate>: ValidateBox<V.Value, V.Failure> {
    private let validator: V

    init(validator: V) {
        self.validator = validator
    }

    override
    func validate(_ value: V.Value) -> ValidateResult<V.Failure> {
        validator.validate(value)
    }
}
