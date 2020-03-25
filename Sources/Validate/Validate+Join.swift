import Foundation

extension Validate {
    @available(OSX 10.15.0, *)
    @available(iOS 13.0.0, *)
    func join<V: Validate>(with: V) -> some Validate where V.Value == Value, V.Failure == Failure {
        ValidateCollection(self, with)
    }
}
