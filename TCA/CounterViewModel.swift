//
//  CounterViewModel.swift
//  TCA
//
//  Created by takemoto on 2026/10/21.
//

import SwiftUI

@MainActor
@Observable
final class CounterViewModel {
    var count = 0

    func increment() {
        count += 1
    }

    func decrement() {
        count -= 1
    }

    func reset() {
        count = 0
    }
}
