#if os(iOS)
import SwiftUI

// MARK: SwiftUI.Picker { ... }.pickerStyle(.wheel)

public struct PickerWithWheelStyleType: IntrospectableViewType {
    public enum Style {
        case wheel
    }
}

extension IntrospectableViewType where Self == PickerWithWheelStyleType {
    public static func picker(style: Self.Style) -> Self { .init() }
}

#if canImport(UIKit)
extension iOSViewVersion<PickerWithWheelStyleType, UIPickerView> {
    public static let v13 = Self(for: .v13)
    public static let v14 = Self(for: .v14)
    public static let v15 = Self(for: .v15)
    public static let v16 = Self(for: .v16)
}
#endif
#endif
