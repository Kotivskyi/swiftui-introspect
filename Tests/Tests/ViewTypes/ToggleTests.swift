#if !os(tvOS)
import SwiftUI
import SwiftUIIntrospect
import XCTest

final class ToggleTests: XCTestCase {
    #if canImport(UIKit)
    typealias PlatformToggle = UISwitch
    #elseif canImport(AppKit)
    typealias PlatformToggle = NSButton
    #endif

    func testToggle() {
        XCTAssertViewIntrospection(of: PlatformToggle.self) { spies in
            let spy0 = spies[0]
            let spy1 = spies[1]
            let spy2 = spies[2]

            VStack {
                Toggle("", isOn: .constant(true))
                    #if os(iOS)
                    .introspect(.toggle, on: .iOS(.v13, .v14, .v15, .v16), customize: spy0)
                    #elseif os(macOS)
                    .introspect(.toggle, on: .macOS(.v10_15, .v11, .v12, .v13), customize: spy0)
                    #endif

                Toggle("", isOn: .constant(false))
                    #if os(iOS)
                    .introspect(.toggle, on: .iOS(.v13, .v14, .v15, .v16), customize: spy1)
                    #elseif os(macOS)
                    .introspect(.toggle, on: .macOS(.v10_15, .v11, .v12, .v13), customize: spy1)
                    #endif

                Toggle("", isOn: .constant(true))
                    #if os(iOS)
                    .introspect(.toggle, on: .iOS(.v13, .v14, .v15, .v16), customize: spy2)
                    #elseif os(macOS)
                    .introspect(.toggle, on: .macOS(.v10_15, .v11, .v12, .v13), customize: spy2)
                    #endif
            }
        } extraAssertions: {
            #if canImport(UIKit)
            XCTAssertEqual($0[safe: 0]?.isOn, true)
            XCTAssertEqual($0[safe: 1]?.isOn, false)
            XCTAssertEqual($0[safe: 2]?.isOn, true)
            #elseif canImport(AppKit)
            XCTAssertEqual($0[safe: 0]?.state, .on)
            XCTAssertEqual($0[safe: 1]?.state, .off)
            XCTAssertEqual($0[safe: 2]?.state, .on)
            #endif
        }
    }
}
#endif
