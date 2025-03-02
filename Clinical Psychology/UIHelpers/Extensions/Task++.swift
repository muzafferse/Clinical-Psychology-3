//
//  Task++.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 8.09.2024.
//

import SwiftUI

extension Task where Success == Never, Failure == Never {
    static func sleep(for seconds: Double) async throws {
        try await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
    }
}
