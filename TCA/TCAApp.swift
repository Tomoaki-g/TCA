//
//  TCAApp.swift
//  TCA
//
//  Created by takemoto on 2026/10/21.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAStudyApp: App {
    var body: some Scene {
        WindowGroup {
            CounterView(
                store: Store(
                    initialState:
                        CounterFeature.State()
                ) {
                    CounterFeature()
                }
            )
        }
    }
}
